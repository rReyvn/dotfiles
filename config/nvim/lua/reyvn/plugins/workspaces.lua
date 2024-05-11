return {
	{
		"natecraddock/workspaces.nvim",
		cmd = {
			"WorkspacesAdd",
			"WorkspacesAddDir",
			"WorkspacesList",
			"WorkspacesListDirs",
			"WorkspacesRemove",
			"WorkspacesRemoveDir",
			"WorkspacesRename",
			"WorkspacesSyncDirs",
		},
		keys = {
			{
				"<leader>wl",
				":Telescope workspaces<CR>",
				desc = "[W]orkspaces [L]ist",
				silent = true,
			},
		},
		config = function()
			require("workspaces").setup({
				hooks = {
					open = { "Telescope find_files" },
				},
			})
		end,
	},
}
