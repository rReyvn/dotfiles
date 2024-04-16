return {
	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup({
				mapping = { "jk" },
				timeout = vim.o.timeoutlen,
				clear_empty_lines = false,
				keys = "<Esc>",
			})
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("gitsigns").setup({
				on_attach = function(bufnr)
					vim.keymap.set(
						"n",
						"[h",
						require("gitsigns").prev_hunk,
						{ buffer = bufnr, desc = "Git Previous Hunk" }
					)
					vim.keymap.set("n", "]h", require("gitsigns").next_hunk, { buffer = bufnr, desc = "Git Next Hunk" })
					vim.keymap.set(
						"n",
						"<leader>gp",
						require("gitsigns").preview_hunk,
						{ buffer = bufnr, desc = "[G]itsigns [P]review" }
					)
				end,
			})
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		"numToStr/Comment.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>bf",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		opts = {
			-- Define your formatters
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { { "prettierd", "prettier" } },
				css = { { "prettierd", "prettier" } },
				-- python = { "isort", "black" },
				-- blade = { "blade_formatter" },
			},
			-- Set up format-on-save
			format_on_save = { timeout_ms = 500, async = true, lsp_fallback = true },
			-- Customize formatters
			formatters = {
				shfmt = {
					prepend_args = { "-i", "2" },
				},
			},
		},
		init = function()
			vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		end,
	},
	{
		"windwp/nvim-ts-autotag",
		ft = {
			"html",
			"js",
			"ts",
			"php",
			"md",
			"xml",
		},
		-- event = { "BufReadPre", "BufNewFile" },
		opts = {},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup({
				ensure_installed = { "html", "css", "lua", "markdown", "vim", "vimdoc" },
				sync_install = false,
				ignore_install = {},
				auto_install = true,
				highlight = { enable = true },
				-- indent = { enable = true },
				autotag = { enable = true },
			})
		end,
	},
	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		cmd = "Telescope",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make || mingw32-make",
				cond = "make",
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },
		},
		config = function()
			require("telescope").setup({
				defaults = {
					layout_strategy = "flex",
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
					workspaces = {
						keep_insert = true,
					},
				},
			})

			pcall(require("telescope").load_extension, "workspaces")
			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
			vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
			vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
			vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
			vim.keymap.set("n", "<leader>scw", builtin.grep_string, { desc = "[S]earch [C]urrent [W]ord" })
			vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
			vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
			vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
			vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
			vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

			vim.keymap.set("n", "<leader>/", function()
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "[/] Fuzzily search in current buffer" })

			vim.keymap.set("n", "<leader>s/", function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end, { desc = "[S]earch [/] in Open Files" })

			vim.keymap.set("n", "<leader>sn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "[S]earch [N]eovim files" })
		end,
	},
}
