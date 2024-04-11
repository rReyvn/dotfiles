return {
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = {
			theme = "gruvbox-material",
			options = {
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = {
					{
						"mode",
						separator = { left = "", right = "" },
					},
				},
				lualine_x = { "encoding", "filetype" },
				lualine_z = {
					{
						"location",
						separator = { left = "", right = "" },
					},
				},
			},
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		keys = {
			{ "<leader>ti", ":IBLToggle<CR>", { desc = "[T]oggle [I]ndent Line", silent = true } },
		},
		config = function()
			require("ibl").setup({
				indent = {
					char = "┊",
				},
				whitespace = {
					remove_blankline_trail = false,
				},
				scope = {
					enabled = false,
				},
			})
		end,
	},
	{
		"goolord/alpha-nvim",
		config = function()
			local dashboard = require("alpha.themes.dashboard")

			-- Header
			dashboard.section.header.val = {
				"                                                     ",
				"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
				"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
				"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
				"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
				"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
				"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
				"                                                     ",
			}
			-- Set menu
			dashboard.section.buttons.val = {
				dashboard.button("e", "󰙅  > Explore", ":Explore<CR>"),
				dashboard.button("f", "󰈞  > Find File", ":Telescope find_files<CR>"),
				dashboard.button("l", "󰆓  > Load Session", ":SessionManager load_current_dir_session<CR>"),
				dashboard.button("L", "󰆓  > List Session", ":SessionManager load_session<CR>"),
				dashboard.button("o", "󰉓  > Open Workspace", ":WorkspacesOpen<CR>"),
				dashboard.button("s", "  > Settings", ":e $MYVIMRC | :cd %:p:h | pwd<CR>"),
				dashboard.button("q", "󰿅  > Quit", ":qa<CR>"),
			}

			require("alpha").setup(dashboard.opts)

			-- Disable folding on alpha buffer
			vim.cmd([[
        autocmd FileType alpha setlocal nofoldenable
      ]])
		end,
	},
	-- NOTE : Notification UI
	-- {
	-- 	"j-hui/fidget.nvim",
	-- 	opts = {},
	-- },
}
