-- bootstrap lazy.nvim, LazyVim and your plugins
require("mine.lazy.lazy")

require("mine.config.keymaps")
require("mine.config.options")
require("mine.lsp")

--disable the inlaly hints
vim.lsp.inlay_hint.enable = function() end

vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		require("mine.config.cowboy").cowboy()
	end,
})
