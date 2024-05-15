if vim.g.vscode then
	require("reyvn.extras.vscode")
else
	if vim.fn.has("linux") == 1 then
		require("reyvn.core")
		require("reyvn.lazy")
	end
end
