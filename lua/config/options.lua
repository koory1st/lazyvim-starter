-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local font = require("config.nerd_font")

local signs = {
  { name = "DiagnosticSignError", text = font.DiagnosticError },
  { name = "DiagnosticSignWarn", text = font.DiagnosticWarn },
  { name = "DiagnosticSignHint", text = font.DiagnosticHint },
  { name = "DiagnosticSignInfo", text = font.DiagnosticInfo },
  { name = "DiagnosticSignError", text = font.DiagnosticError },
  { name = "DapStopped", text = font.DapStopped, texthl = "DiagnosticWarn" },
  { name = "DapBreakpoint", text = font.DapBreakpoint, texthl = "DiagnosticInfo" },
  { name = "DapBreakpointRejected", text = font.DapBreakpointRejected, texthl = "DiagnosticError" },
  { name = "DapBreakpointCondition", text = font.DapBreakpointCondition, texthl = "DiagnosticInfo" },
  { name = "DapLogPoint", text = font.DapLogPoint, texthl = "DiagnosticInfo" },
}

for _, sign in ipairs(signs) do
  if not sign.texthl then
    sign.texthl = sign.name
  end
  vim.fn.sign_define(sign.name, sign)
end

vim.o.relativenumber = false
