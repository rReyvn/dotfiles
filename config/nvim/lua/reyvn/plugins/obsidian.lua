return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	-- ft = "markdown",
	event = {
		"BufReadPre " .. vim.fn.expand("~") .. "/Dev/Notes/ReyVault/**.md",
		"BufNewFile " .. vim.fn.expand("~") .. "/Dev/Notes/ReyVault/**.md",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "Personal",
				path = "~/Dev/Notes/ReyVault",
			},
		},
	},
}
