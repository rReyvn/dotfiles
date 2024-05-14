return {
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
				mappings = {
					n = {
						["<C-c>"] = require("telescope.actions").close,
					},
				},
				layout_strategy = "flex",
				file_ignore_patterns = {
					"%.o",
					"%.a",
					"%.out",
					"%.class",
					"%.pdf",
					"%.mkv",
					"%.mp4",
					"%.webm",
					"%.zip",
					"%.png",
					"%.jpg",
					"%.ico",
					"%.webp",
				},
			},
			pickers = {
				buffers = {
					mappings = {
						n = {
							["dd"] = require("telescope.actions").delete_buffer,
						},
					},
				},
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

		-- Telescope Extensions
		pcall(require("telescope").load_extension, "workspaces")
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")

		-- Telescope Keymap
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
		vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "[G]it [S]tatus" })
		vim.keymap.set("n", "<leader>gS", builtin.git_stash, { desc = "[G]it [S]tash" })
		vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "[G]it [B]ranch" })
		vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "[G]it [C]ommits" })
	end,
}
