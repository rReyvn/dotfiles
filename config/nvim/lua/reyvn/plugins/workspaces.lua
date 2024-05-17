return {
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
			"<Plug>(ProjectWorkspaces)",
			":Telescope workspaces<CR>",
		},
	},
	config = function()
		require("workspaces").setup({
			hooks = {
				open = { "Telescope find_files" },
			},
		})
	end,
}
