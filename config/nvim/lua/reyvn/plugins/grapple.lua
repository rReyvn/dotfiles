return {
	"cbochs/grapple.nvim",
	opts = {
		scope = "git",
	},
	event = { "BufReadPost", "BufNewFile" },
	cmd = "Grapple",
	keys = {
		{
			"<tab>t",
			":Grapple toggle<cr>",
			desc = "Grapple toggle tag",
		},
		{
			"<tab><tab>",
			":Grapple toggle_tags<cr>",
			desc = "Grapple open tags window",
			silent = true,
		},
		{
			"<tab>h",
			":Grapple cycle_tags next<cr>",
			desc = "Grapple cycle next tag",
			silent = true,
		},
		{
			"<tab>l",
			":Grapple cycle_tags prev<cr>",
			desc = "Grapple cycle previous tag",
			silent = true,
		},
	},
}
