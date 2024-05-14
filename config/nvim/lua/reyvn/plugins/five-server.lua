return {
	"Diogo-ss/five-server.nvim",
	cmd = { "FiveServer" },
	build = function()
		require("fs.utils.install")()
	end,
	opts = {
		notify = true,
	},
	config = function(_, opts)
		require("fs").setup(opts)
	end,
}
