return {
	{
		"shaunsingh/nord.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			-- Enable subtle background transparency to keep your hyprland blur/wallpaper showing
			vim.g.nord_contrast = true
			vim.g.nord_borders = true
			vim.g.nord_disable_background = true -- Set to false if you prefer solid dark backgrounds

			require("nord").set()
		end,
	},
}
