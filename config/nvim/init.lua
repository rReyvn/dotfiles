if vim.g.vscode then
	require("extras.vscode")
else
	if vim.fn.has("linux") == 1 then
		require("core.option")
		require("core.lazy")

		-- Load autocommands configuration
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				require("core.autocmds")
				require("core.keymap")
			end,
		})
	end
end
