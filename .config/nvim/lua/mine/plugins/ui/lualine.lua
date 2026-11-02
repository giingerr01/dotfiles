return {
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		opts = function(_, opts)
			-- 1. Ensure options and sections tables exist before mutating them
			opts.options = opts.options or {}
			opts.sections = opts.sections or {}
			opts.sections.lualine_c = opts.sections.lualine_c or {}
			opts.sections.lualine_x = opts.sections.lualine_x or {}

			-- 2. Force lualine to follow your active Neovim colorscheme dynamically
			opts.options.theme = "auto"
			opts.options.globalstatus = true

			-- 3. Custom dashboard indicator (supports LazyVim's default Snacks dashboard & Alpha)
			table.insert(opts.sections.lualine_c, 1, {
				function()
					local ft = vim.bo.filetype
					if ft == "snacks_dashboard" or ft == "alpha" then
						return "💤 Dashboard"
					end
					return ""
				end,
				color = { fg = "#75f1fa", gui = "bold" },
			})

			-- 4. Right-side indicator for the dashboard
			table.insert(opts.sections.lualine_x, {
				function()
					local ft = vim.bo.filetype
					if ft == "snacks_dashboard" or ft == "alpha" then
						return "LazyVim IDE"
					end
					return ""
				end,
				color = { fg = "#71717a" },
			})
		end,
	},
}
