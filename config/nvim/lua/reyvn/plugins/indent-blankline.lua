return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	keys = {
		{
			"<Plug>(IBLToggle)",
			":IBLToggle<CR>",
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
}
