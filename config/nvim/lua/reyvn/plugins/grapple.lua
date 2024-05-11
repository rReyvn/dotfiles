return {
	"cbochs/grapple.nvim",
	opts = {
		scope = "git",
	},
	event = { "BufReadPost", "BufNewFile" },
	cmd = "Grapple",
	keys = {
		{ "<leader>tg", ":Grapple toggle<cr>", desc = "Grapple toggle tag" },
		{ "<leader><leader>", ":Grapple toggle_tags<cr>", desc = "Grapple open tags window" },
		{ "]g", ":Grapple cycle_tags next<cr>", desc = "Grapple cycle next tag" },
		{ "[g", ":Grapple cycle_tags prev<cr>", desc = "Grapple cycle previous tag" },
	},
}
