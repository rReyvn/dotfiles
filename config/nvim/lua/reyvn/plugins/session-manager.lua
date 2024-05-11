return {
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
}
