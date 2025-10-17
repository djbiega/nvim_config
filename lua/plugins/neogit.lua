return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"sindrets/diffview.nvim",
		"nvim-telescope/telescope.nvim", -- optional
	},
	config = function()
		local neogit = require("neogit")
		neogit.setup({
			commit_editor = {
				kind = "tab",
				show_staged_diff = true,
				staged_diff_split_kind = "auto",
				spell_check = true,
			},
			integrations = {
				telescope = true,
				diffview = true,
			},
		})
		vim.keymap.set("n", "<leader>ng", function()
			neogit.open()
		end, { desc = "[N]eo[G]it" })
	end,
}
