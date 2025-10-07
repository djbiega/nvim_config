-- [[ Configure and install plugins ]]
--
-- NOTE: Here is where you install your plugins.
--
--
require("lazy").setup({
	require("plugins.guess-indent"),
	require("plugins.gitsigns"),
	require("plugins.which-key"),
	require("plugins.telescope"),
	require("plugins.nvim-lspconfig"),
	require("plugins.conform"),
	require("plugins.blink"),
	require("plugins.tokyonight"),
	require("plugins.todo-comments"),
	require("plugins.markview"),
	require("plugins.mini"),
	require("plugins.neogen"),
	require("plugins.nvim-treesitter"),
}, {
	ui = {
		-- If you are using a Nerd Font: set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})

-- vim: ts=2 sts=2 sw=2 et
