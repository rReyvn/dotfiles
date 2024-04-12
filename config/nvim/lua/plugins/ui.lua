return {
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		config = function()
			local configuration = vim.fn["gruvbox_material#get_configuration"]()
			local palette = vim.fn["gruvbox_material#get_palette"](
				configuration.background,
				configuration.foreground,
				configuration.colors_override
			)

			local conditions = {
				buffer_not_empty = function()
					return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
				end,
				hide_in_width = function()
					return vim.fn.winwidth(0) > 75
				end,
			}

			require("lualine").setup({
				theme = "gruvbox-material",
				options = {
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					-- Single Statusline instead one per every window
					-- globalstatus = true,
				},
				sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_y = {},
					lualine_z = {},
					-- Filled Area
					lualine_c = {
						{
							function()
								return "▊"
							end,
							color = { fg = palette.yellow[1] },
							padding = { right = 1 },
						},
						{
							-- function()
							-- 	return "󰫢"
							-- end,
							"mode",
							padding = { right = 1 },
						},
						{
							"filename",
							cond = conditions.buffer_not_empty,
						},
						"diagnostics",
					},
					lualine_x = {
						{
							"branch",
							icon = "",
							cond = conditions.hide_in_width,
						},
						{
							"diff",
							cond = conditions.hide_in_width,
						},
						{
							"encoding",
							cond = conditions.hide_in_width,
							fmt = string.upper,
						},
						{
							"filetype",
							cond = conditions.hide_in_width,
							icons_enabled = false,
							fmt = string.upper,
						},
						{
							"location",
							padding = 0,
						},
						{
							function()
								return "▊"
							end,
							color = { fg = palette.yellow[1] },
							padding = { left = 1 },
						},
					},
				},
			})
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		keys = {
			{
				"<leader>ti",
				":IBLToggle<CR>",
				desc = "[T]oggle [I]ndent Blankline",
				silent = true,
			},
		},
		config = function()
			require("ibl").setup({
				indent = {
					char = "┊",
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
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {},
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
	},
	{
		"NvChad/nvim-colorizer.lua",
		keys = {
			{
				"<leader>tc",
				":ColorizerToggle<CR>",
				desc = "[T]oggle [C]olorizer",
				silent = true,
			},
		},
		opts = {
			-- user_default_options = { mode = "virtualtext" },
		},
	},
	-- NOTE : Notification UI
	-- {
	-- 	"j-hui/fidget.nvim",
	-- 	opts = {},
	-- },
}
