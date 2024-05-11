return {
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
}
