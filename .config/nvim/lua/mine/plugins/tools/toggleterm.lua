return {
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {
		-- Automatically set working directory to current active buffer
		dir = "buffer",
		open_mapping = [[<C-/>]],
		direction = "float", -- Options: 'horizontal', 'vertical', 'float', 'tab'
		shade_terminals = true,
		float_opts = {
			border = "curved",
		},
	},
	keys = {
		{ "<C-/>", "<cmd>ToggleTerm<cr>", mode = { "n", "t" }, desc = "Toggle Terminal" },
		{ "<C-_>", "<cmd>ToggleTerm<cr>", mode = { "n", "t" }, desc = "Toggle Terminal" },
	},
}
