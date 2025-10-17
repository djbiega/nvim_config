-- Autocompletion

return {
	"saghen/blink.cmp",
	event = "VimEnter",
	version = "1.*",
	dependencies = {
		-- Snippet Engine
		{
			"L3MON4D3/LuaSnip",
			version = "2.*",
			build = "make install_jsregexp",
			dependencies = {
				{
					"rafamadriz/friendly-snippets",
					config = function()
						require("luasnip.loaders.from_vscode").lazy_load()
					end,
				},
			},
			opts = {},
		},
		"folke/lazydev.nvim",
	},
	--- @module 'blink.cmp'
	--- @type blink.cmp.Config
	opts = {
		keymap = {
			preset = "none",
			["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
			["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
			["<CR>"] = { "accept", "fallback" },
			["<C-Space>"] = { "show", "show_documentation", "hide" },
			["<C-e>"] = { "hide" },
			["<C-u>"] = { "scroll_signature_up", "fallback" },
			["<C-d>"] = { "scroll_signature_down", "fallback" },
			["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
		},

		appearance = {
			-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = "mono",
		},

		completion = {
			documentation = { auto_show = true, auto_show_delay_ms = 100 },
		},

		sources = {
			default = { "lsp", "path", "snippets", "lazydev" },
			providers = {
				lazydev = { module = "lazydev.integrations.blink", score_offset = 100 },
				snippets = {
					name = "snippets",
					module = "blink.cmp.sources.snippets",
					opts = {
						show_autosnippets = true,
						documentation = function(snippet)
							if type(snippet.body) == "table" then
								return {
									kind = "markdown",
									value = "```"
										.. (snippet.lang or "")
										.. "\n"
										.. table.concat(snippet.body, "\n")
										.. "\n```",
								}
							elseif type(snippet.body) == "string" then
								return {
									kind = "markdown",
									value = "```\n" .. snippet.body .. "\n```",
								}
							end
						end,
					},
				},
			},
		},

		snippets = { preset = "luasnip" },
		fuzzy = { implementation = "prefer_rust_with_warning" },

		-- Shows a signature help window while you type arguments for a function
		signature = { enabled = true },
	},
}
