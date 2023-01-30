-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- This file is automatically loaded by lazyvim.plugins.config

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

local function n(lhs, rhs, options)
  map("n", lhs, rhs, options)
end
local function v(lhs, rhs, options)
  map("v", lhs, rhs, options)
end
local function i(lhs, rhs, options)
  map("i", lhs, rhs, options)
end

n("<F5>", "<cmd>DapContinue<cr>", { desc = "Debugger: Start" })
n("<F17>", "<cmd>DapTerminate<cr>", { desc = "Debugger: Stop" })
n(
  "<F9>",
  "<cmd>lua require('persistent-breakpoints.api').toggle_breakpoint()<cr>",
  { desc = "Debugger: Toggle Breakpoint" }
)
n("<F10>", "<cmd>DapStepOver<cr>", { desc = "Debugger: Step Over" })
n("<F11>", "<cmd>DapStepOver<cr>", { desc = "Debugger: Step In" })
