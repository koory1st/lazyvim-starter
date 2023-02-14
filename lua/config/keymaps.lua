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
local function stop_debug()
  require("dapui").close()
  require("dap").terminate()
end

local wk = require("which-key")

wk.register({
  c = {
    name = "Code",
    c = { "<cmd>Lspsaga code_action<CR>", "Code Action saga" },
    s = { "<cmd>Lspsaga outline<CR>", "Symbols Outline" },
    p = { "<cmd>Lspsaga peek_definition<CR>", "Peek Definition" },
    h = { "<cmd>Lspsaga hover_doc<CR>", "Hover Doc" },
    I = { "<cmd>Lspsaga incoming_calls<CR>", "Incoming Calls" },
    O = { "<cmd>Lspsaga outcoming_calls<CR>", "Outcoming Calls" },
    D = {
      function()
        require("telescope.builtin").lsp_definitions()
      end,
      "Go to Definition",
    },
    R = {
      function()
        require("telescope.builtin").lsp_references()
      end,
      "References",
    },
    i = {
      function()
        require("telescope.builtin").lsp_implementations()
      end,
      "Implementation",
    },
  },
  d = {
    name = "Debug",
    c = { "<cmd>DapContinue<cr>", "Start/Continue" },
    o = { "<cmd>DapStepOver<cr>", "Step Over" },
    i = { "<cmd>DapStepIn<cr>", "Step In" },
    b = { "<cmd>lua require('persistent-breakpoints.api').toggle_breakpoint()<cr>", "Toggle Breakpoint" },
    T = { stop_debug, "Stop" },
    F = {
      function()
        require("telescope").extensions.dap.frames({})
      end,
      "List Frames",
    },
    B = {
      function()
        require("telescope").extensions.dap.list_breakpoints({})
      end,
      "List Breakpoints",
    },
  },
  t = {
    name = "Terminal",
    f = { "<cmd>ToggleTerm direction=float<cr>", "ToggleTerm float" },
    h = { "<cmd>ToggleTerm direction=horizontal<cr>", "ToggleTerm horizontal" },
    v = { "<cmd>ToggleTerm direction=vertical<cr>", "ToggleTerm vertical" },
  },
  T = {
    name = "Test",
    n = { "<cmd>lua require('neotest').run.run()<cr>", "Nearest" },
    f = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "File" },
    d = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Debug Nearest" },
    S = { "<cmd>lua require('neotest').run.stop()<cr>", "Stop Nearest" },
    a = { "<cmd>lua require('neotest').run.attach()<cr>", "Attach Nearest" },
  },
  n = {
    name = "Navigate",
    w = { "<cmd>HopWord<cr>", "Hop Word" },
  },
}, {
  prefix = "<leader>",
})

i("<A-;>", "<esc>A;<esc>", { desc = "Append semic" })
i("<D-;>", "<esc>A;<esc>", { desc = "Append semic" })

n("<F5>", "<cmd>DapContinue<cr>", { desc = "Debugger: Start" })
n("<F17>", "<cmd>DapTerminate<cr>", { desc = "Debugger: Stop" })
n(
  "<F9>",
  "<cmd>lua require('persistent-breakpoints.api').toggle_breakpoint()<cr>",
  { desc = "Debugger: Toggle Breakpoint" }
)
n("<F10>", "<cmd>DapStepOver<cr>", { desc = "Debugger: Step Over" })
n("<F11>", "<cmd>DapStepIn<cr>", { desc = "Debugger: Step In" })

n("<F7>", "<cmd>ToggleTerm<cr>", { desc = "Toggle Terminal" })
n("f", "<cmd>HopChar1AC<cr>", { desc = "Hop Forward" })
n("F", "<cmd>HopChar1BC<cr>", { desc = "Hop Backward" })
