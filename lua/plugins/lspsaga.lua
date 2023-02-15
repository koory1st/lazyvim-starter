return {
  "glepnir/lspsaga.nvim",
  event = "BufRead",
  config = function()
    require("lspsaga").setup({
      use_saga_diagnostic_sign = false,
    })
  end,
  dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
