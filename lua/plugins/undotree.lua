return {
	"mbbill/undotree",
	config = function()
		-- Recommended settings
		vim.g.undotree_WindowLayout = 2 -- Split layout (tree on right, diff below)
		vim.g.undotree_SplitWidth = 40 -- Width of the undotree window
		vim.g.undotree_SetFocusWhenToggle = 1 -- Focus the undotree when opened
		vim.g.undotree_DiffpanelHeight = 15 -- Height of the diff panel
		vim.g.undotree_DiffAutoOpen = 1 -- Auto-open diff panel
		vim.g.undotree_HelpLine = 0 -- Hide the help line for a cleaner look
		vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
	end,
}
