return {
	"danymat/neogen",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"L3MON4D3/LuaSnip",
	},
	config = function()
		local neogen = require("neogen")

		neogen.setup({
			snippet_engine = "luasnip",
		})

		-- Neogen supports 4 annotation types depending on the language being used
		--
		-- func | class | type | file
		-- [Neogen][func]
		vim.keymap.set("n", "<leader>nf", function()
			neogen.generate({ type = "func" })
		end, { desc = "[N]eogen [F]unction annotation" })

		vim.keymap.set("n", "<leader>nc", function()
			neogen.generate({ type = "class" })
		end, { desc = "[N]eogen [C]lass annotation" })

		vim.keymap.set("n", "<leader>nt", function()
			neogen.generate({ type = "type" })
		end, { desc = "[N]eogen [T]ype annotation" })
	end,
}
