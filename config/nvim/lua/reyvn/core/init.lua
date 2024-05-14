local list = "reyvn.core."

require(list .. "option")

-- Load autocommands configuration
vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		require(list .. "autocmds")
		require(list .. "keymap")
		require(list .. "terminal")
	end,
})
