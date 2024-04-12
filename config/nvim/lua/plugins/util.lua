return {
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
	},
	{
		"Shatur/neovim-session-manager",
		config = function()
			local session_manager = require("session_manager")
			local config = require("session_manager.config")

			session_manager.setup({
				autoload_mode = config.AutoloadMode.Disabled,
				autosave_last_session = false,
			})

			vim.keymap.set("n", "<leader>sma", ":SessionManager available_commands<CR>")
			vim.keymap.set("n", "<leader>sml", ":SessionManager load_session<CR>")
			vim.keymap.set("n", "<leader>sms", ":SessionManager save_current_session<CR>")
		end,
	},
	{
		"natecraddock/workspaces.nvim",
		cmd = {
			"WorkspacesAdd",
			"WorkspacesAddDir",
			"WorkspacesList",
			"WorkspacesListDirs",
			"WorkspacesRemove",
			"WorkspacesRemoveDir",
			"WorkspacesRename",
			"WorkspacesSyncDirs",
		},
		keys = {
			{
				"<leader>wl",
				":Telescope workspaces<CR>",
				desc = "[W]orkspaces [L]ist",
				silent = true,
			},
		},
		config = function()
			require("workspaces").setup({
				hooks = {
					open = { "Telescope find_files" },
				},
			})
		end,
	},
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = true,
		-- ft = "markdown",
		event = {
			"BufReadPre " .. vim.fn.expand("~") .. "/Dev/Notes/ReyVault/**.md",
			"BufNewFile " .. vim.fn.expand("~") .. "/Dev/Notes/ReyVault/**.md",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			workspaces = {
				{
					name = "Personal",
					path = "~/Dev/Notes/ReyVault",
				},
			},
		},
	},
	{
		"Diogo-ss/five-server.nvim",
		cmd = { "FiveServer" },
		build = function()
			require("fs.utils.install")()
		end,
		opts = {
			notify = true,
		},
		config = function(_, opts)
			require("fs").setup(opts)
		end,
	},
	{
		"uga-rosa/ccc.nvim",
		cmd = { "CccPick" },
		opts = {},
	},
	-- NOTE : Tmux Pane Navigate
	-- {
	-- 	"aserowy/tmux.nvim",
	-- 	config = function()
	-- 		return require("tmux").setup()
	-- 	end,
	-- },
}
