return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		formatters_by_ft = {
			c = { "clang_format" },
			c_sharp = { "csharpier" },
			cs = { "csharpier" },
			json = { "prettierd" },
			lua = { "stylua" },
			markdown = { "prettierd" },
			python = { "ruff_format", "ruff_organize_imports" },
			rust = { "rustfmt" },
		},
	},
}
