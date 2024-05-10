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

			vim.keymap.set(
				"n",
				"<leader>Sa",
				":SessionManager available_commands<CR>",
				{ desc = "[S]ession [A]vailable commands" }
			)
			vim.keymap.set("n", "<leader>Sl", ":SessionManager load_session<CR>", { desc = "[S]ession [L]oad session" })
			vim.keymap.set(
				"n",
				"<leader>Ss",
				":SessionManager save_current_session<CR>",
				{ desc = "[S]ession [S]ave Session" }
			)
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
		cmd = { "CccPick", "CccConvert" },
		opts = {},
	},
	{
		"NvChad/nvim-colorizer.lua",
		keys = {
			{
				"<leader>tc",
				":ColorizerToggle<CR>",
				desc = "[T]oggle [C]olorizer",
			},
		},
		config = function()
			require("colorizer").setup({
				filetypes = { "*" },
				user_default_options = {
					RGB = true, -- #RGB hex codes
					RRGGBB = true, -- #RRGGBB hex codes
					names = true, -- "Name" codes like Blue or blue
					-- RRGGBBAA = false, -- #RRGGBBAA hex codes
					-- AARRGGBB = false, -- 0xAARRGGBB hex codes
					rgb_fn = true, -- CSS rgb() and rgba() functions
					hsl_fn = true, -- CSS hsl() and hsla() functions
					css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
					css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
					-- Available modes for `mode`: foreground, background,  virtualtext
					-- mode = "background", -- Set the display mode.
					-- Available methods are false / true / "normal" / "lsp" / "both"
					-- True is same as normal
					-- tailwind = false, -- Enable tailwind colors
					-- parsers can contain values used in |user_default_options|
					-- sass = { enable = false, parsers = { "css" } }, -- Enable sass colors
					-- virtualtext = "■",
					-- update color values even if buffer is not focused
					-- example use: cmp_menu, cmp_docs
					-- always_update = false,
				},
				-- all the sub-options of filetypes apply to buftypes
				-- buftypes = {},
			})
		end,
	},
}
