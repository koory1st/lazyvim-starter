return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "shellcheck",
      "shfmt",
      "flake8",
      "rust-analyzer",
      "codelldb",
      "rustfmt",
    },
  },
}
