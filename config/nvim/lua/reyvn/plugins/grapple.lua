return {
	"cbochs/grapple.nvim",
	opts = {
		scope = "git",
	},
	event = { "BufReadPost", "BufNewFile" },
	cmd = "Grapple",
	keys = {
		{
			"<Plug>(GrappleTag)",
			":Grapple toggle<cr>",
		},
		{
			"<Plug>(GrappleOpenTag)",
			":Grapple toggle_tags<cr>",
		},
		{
			"<Plug>(GrappleNextTag)",
			":Grapple cycle_tags next<cr>",
		},
		{
			"<Plug>(GrapplePreviousTag)",
			":Grapple cycle_tags prev<cr>",
		},
	},
}
