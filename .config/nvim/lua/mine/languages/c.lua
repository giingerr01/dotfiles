return {
	{ import = "lazyvim.plugins.extras.lang.clangd" },
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"c",
				"csharp",
			},
		},
	},
}
