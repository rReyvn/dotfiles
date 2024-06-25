local wk = require("which-key")

wk.register({
	["<leader>b"] = { name = "Buffer" },
	["<leader>y"] = { name = "Yank" },
	["<leader>t"] = { name = "Toggle" },
	["<leader>g"] = { name = "Git" },
	["<leader>w"] = { name = "Workspace" },
	["<leader>s"] = { name = "Search" },
	["<leader>S"] = { name = "Session" },
})
