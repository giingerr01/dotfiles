return {
  {
    "folke/snacks.nvim",
    opts = {
      explorer = {
        replace_netrw = false,
      },
      picker = {
        sources = {
          explorer = {
            hidden = true,
            auto_open = false,

            keys = {
              ["l"] = "confirm",
              ["<CR>"] = "confirm",
              ["h"] = "close",

              ["a"] = "create",
              ["r"] = "rename",
              ["d"] = "delete",

              ["y"] = "copy",
              ["p"] = "paste",
              ["x"] = "cut",
            },
          },
        },
      },
    },

    keys = {
      {
        "<leader>e",
        function()
          Snacks.explorer({ cwd = false })
        end,
        desc = "Explorer (cwd)",
      },
      {
        "<leader>E",
        function()
          Snacks.explorer()
        end,
        desc = "Explorer (root)",
      },
    },
  },
}
