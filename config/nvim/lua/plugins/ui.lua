return {
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		config = function()
			local lualine = require("lualine")
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

			local config = {
				theme = "gruvbox-material",
				options = {
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					-- Single Statusline instead one per every window
					globalstatus = true,
				},
				sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_y = {},
					lualine_z = {},
					lualine_c = {},
					lualine_x = {},
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_y = {},
					lualine_z = {},
					lualine_c = {},
					lualine_x = {},
				},
			}

			local function ins_left(component)
				table.insert(config.sections.lualine_c, component)
			end

			local function ins_right(component)
				table.insert(config.sections.lualine_x, component)
			end

			ins_left({
				function()
					return "▊"
				end,
				color = { fg = palette.yellow[1] },
				padding = { right = 1 },
			})

			ins_left({
				"mode",
				padding = { right = 1 },
			})

			ins_left({
				"filename",
				cond = conditions.buffer_not_empty,
			})

			ins_left({
				"diagnostics",
			})

			ins_right({
				"location",
			})

			ins_right({
				"branch",
				icon = "",
				cond = conditions.hide_in_width,
			})

			ins_right({
				"diff",
				cond = conditions.hide_in_width,
			})

			ins_right({
				"encoding",
				cond = conditions.hide_in_width,
				fmt = string.upper,
			})

			ins_right({
				"filetype",
				cond = conditions.hide_in_width,
				icons_enabled = false,
				fmt = string.upper,
				padding = { left = 1 },
			})

			ins_right({
				function()
					return "▊"
				end,
				color = { fg = palette.yellow[1] },
				padding = { left = 1 },
			})

			lualine.setup(config)
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
			},
		},
		config = function()
			require("ibl").setup({
				enabled = false,
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
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			key_labels = {
				["<space>"] = "SPC",
				["<tab>"] = "TAB",
			},
		},
		config = function()
			local wk = require("which-key")

			wk.register({
				["<leader>b"] = { name = "+Buffer" },
				["<leader>t"] = { name = "+Toggle" },
				["<leader>g"] = { name = "+Git" },
				["<leader>s"] = { name = "+Search" },
				["<leader>S"] = { name = "+Session" },
			})
		end,
	},
	-- NOTE : Notification UI
	-- {
	-- 	"j-hui/fidget.nvim",
	-- 	opts = {},
	-- },
}
