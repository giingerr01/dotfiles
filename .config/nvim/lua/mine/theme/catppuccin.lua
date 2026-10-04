return {
	"catppuccin/nvim",
	lazy = false,
	priority = 1000,

	config = function()
		require("catppuccin").setup({
			-- Main options
			flavour = "mocha", -- latte, frappe, macchiato, mocha
			background = {
				light = "latte",
				dark = "mocha",
			},
			transparent_background = true,
			term_colors = true,
			dim_inactive = {
				enabled = false,
				shade = "dark",
				percentage = 0.15,
			},

			-- Toggle theme style
			toggle_style_key = nil,
			toggle_style_list = {
				"latte",
				"frappe",
				"macchiato",
				"mocha",
			},

			-- Code style
			no_italic = false,
			no_bold = false,
			no_underline = false,
			styles = {
				comments = { "italic" },
				conditionals = { "italic" },
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
				operators = {},
			},

			-- Custom colors
			color_overrides = {},
			custom_highlights = {},

			-- Integrations
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				treesitter = true,
				telescope = true,
				mason = true,
				native_lsp = {
					enabled = true,
					underlines = {
						errors = { "undercurl" },
						hints = { "undercurl" },
						warnings = { "undercurl" },
						information = { "undercurl" },
					},
				},
			},
		})

		vim.cmd.colorscheme("catppuccin")
	end,
}
