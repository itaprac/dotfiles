-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "chadtain",
  -- transparency = true,

  integrations = {
    "treesitter",
  },

  hl_override = {
    -- Comment = { fg = "#848780", italic = true },
    -- ["@comment"] = { fg = "#848780", italic = true },
    -- LineNr = { fg = "#989c90" },
    -- -- LineNr = { fg = "#787c70" },
    -- CursorLineNr = { fg = "#e0e6d8" },

    -- Function = {
    --   fg = "NONE",
    --   bg = "NONE",
    --   sp = "NONE",
    --   bold = false,
    -- },
    -- -- Black theme
    --
    -- Normal = { bg = "#0A0A0A" }, -- Slightly lighter than pure black
    -- NormalFloat = { bg = "#0A0A0A" }, -- Match the main background
    -- NvimTreeNormal = { bg = "#0A0A0A" }, -- Match the main background
    -- StatusLine = { bg = "#0A0A0A", fg = "#989c90" },
    -- StatusLineNC = { bg = "#0A0A0A", fg = "#989c90" },
    -- TabLine = { bg = "#0A0A0A", fg = "#989c90" },
    -- TabLineFill = { bg = "#0A0A0A" },
    -- TabLineSel = { bg = "#0A0A0A", fg = "#e0e6d8" },
    -- BufferLineBackground = { bg = "#0A0A0A", fg = "#989c90" },
    -- BufferLineFill = { bg = "#0A0A0A" },
    -- BufferLineBufferSelected = { bg = "#0A0A0A", fg = "#e0e6d8", bold = true },
    -- NvimTreeWinSeparator = { bg = "#0A0A0A", fg = "#0A0A0A" },
    -- WinSeparator = { bg = "#0A0A0A", fg = "#0A0A0A" },
  },
}

return M
