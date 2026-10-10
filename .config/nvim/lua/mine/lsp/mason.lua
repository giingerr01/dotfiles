return {
	{
		"mason-org/mason.nvim",
		cmd = "Mason",
		opts = {
			ui = { border = "rounded" },
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = { "mason-org/mason.nvim" },
		opts = {
			automatic_installation = true,
			ensure_installed = {
				"clangd",
				"csharp_ls",
				"jsonls",
				"rust_analyzer",
				"lua_ls",
				"marksman",
				"pyright",
			},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "mason-org/mason.nvim" },
		opts = {
			ensure_installed = {
				"clang-format",
				"lua_ls",
				"prettierd",
				"prettier",
				"rust-analyzer",
				"cssls",
				"emmet_ls",
				"html-lsp",
				"typescript-language-server",
				"ruff",
				"stylua",
			},
		},
	},
}
