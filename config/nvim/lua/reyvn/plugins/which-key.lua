return {
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
			["<leader>w"] = { name = "+Workspace" },
			["<leader>s"] = { name = "+Search" },
			["<leader>S"] = { name = "+Session" },
		})
	end,
}
