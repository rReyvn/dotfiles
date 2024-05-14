return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("gitsigns").setup({
			on_attach = function(bufnr)
				vim.keymap.set("n", "[h", require("gitsigns").prev_hunk, { buffer = bufnr, desc = "Git Previous Hunk" })
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
}
