local M = {}

-- M.base_30 = {
--   white = "#ffffff",
--   black = "#181818", -- nvim bg
--   darker_black = "#101010", -- deeper bg
--   black2 = "#282828", -- darker background
--   one_bg = "#282828", -- same as black2
--   one_bg2 = "#453d41", -- bg+2
--   one_bg3 = "#484848", -- bg+3
--   grey = "#52494e", -- bg+4
--   grey_fg = "#65737e", -- muted comments
--   grey_fg2 = "#6a737d", -- softened grey
--   light_grey = "#f5f5f5",
--   red = "#c73c3f", -- softer red (red-1)
--   baby_pink = "#ff4f58", -- pale red+1
--   pink = "#c73c3f", -- same red-1
--   line = "#282828",
--   green = "#73c936", -- pale green
--   vibrant_green = "#73c936",
--   blue = "#96a6c8", -- niagara for functions
--   nord_blue = "#565f73", -- niagara-1
--   seablue = "#303540", -- niagara-2
--   yellow = "#ffdd33", -- muted yellow
--   sun = "#cc8c3c", -- brown
--   purple = "#9e95c7", -- muted wisteria
--   dark_purple = "#9e95c7",
--   teal = "#95a99f", -- softer quartz
--   orange = "#cc8c3c", -- brown
--   cyan = "#95a99f", -- quartz
--   statusline_bg = "#181818",
--   lightbg = "#282828",
--   pmenu_bg = "#73c936",
--   folder_bg = "#96a6c8", -- niagara for folders
--   fg = "#e4e4ef", -- default fg
--   fg1 = "#f4f4ff", -- lighter fg
--   fg2 = "#f5f5ff", -- even lighter fg
-- }
--
-- M.base_16 = {
--   base00 = "#181818", -- background
--   base01 = "#282828", -- lighter background
--   base02 = "#453d41", -- selection background
--   base03 = "#484848", -- comments, invisibles
--   base04 = "#52494e", -- dark foreground
--   base05 = "#e4e4ef", -- default foreground
--   base06 = "#f4f4ff", -- light foreground
--   base07 = "#ffffff", -- white
--   base08 = "#c73c3f", -- variables, XML tags, markup link text
--   base09 = "#cc8c3c", -- integers, boolean, constants
--   base0A = "#ffdd33", -- classes, markup bold
--   base0B = "#73c936", -- strings, markup code
--   base0C = "#95a99f", -- support, regular expressions
--   base0D = "#96a6c8", -- functions, methods, headings
--   base0E = "#9e95c7", -- keywords, storage
--   base0F = "#ff4f58", -- deprecated tags
-- }
--
M.base_30 = {
  white = "#f0f0f0", -- Pale white
  black = "#181818", -- nvim bg
  darker_black = "#101010", -- deeper bg
  black2 = "#282828", -- darker background
  one_bg = "#282828", -- same as black2
  one_bg2 = "#393939", -- bg+2 (slightly lighter)
  one_bg3 = "#484848", -- bg+3
  grey = "#6b6b6b", -- Paler grey
  grey_fg = "#a1a1a1", -- Muted comments, paler
  grey_fg2 = "#b0b0b0", -- Softer grey, paler
  light_grey = "#f5f5f5", -- Already pale
  red = "#d85f5f", -- Paler red
  baby_pink = "#f08282", -- Pale pink
  pink = "#d85f5f", -- Same as red
  line = "#282828",
  green = "#a5d38c", -- Pale green
  vibrant_green = "#a5d38c", -- Same pale green
  blue = "#b2c8df", -- Pale blue
  nord_blue = "#748598", -- Pale nord_blue
  seablue = "#46505f", -- Paler seablue
  yellow = "#ffdd33", -- Muted yellow (unchanged)
  sun = "#cc8c3c", -- Brown
  purple = "#b7acd8", -- Paler wisteria
  dark_purple = "#b7acd8", -- Same as purple
  teal = "#acc7b5", -- Paler quartz
  orange = "#e3a376", -- Paler brown
  cyan = "#acc7b5", -- Pale quartz
  statusline_bg = "#181818",
  lightbg = "#282828",
  pmenu_bg = "#a5d38c", -- Pale green for the pmenu background
  folder_bg = "#b2c8df", -- Pale blue for folders
  fg = "#e4e4ef", -- Default fg
  fg1 = "#f4f4ff", -- Lighter fg
  fg2 = "#f5f5ff", -- Even lighter fg
}

M.base_16 = {
  base00 = "#181818", -- background
  base01 = "#282828", -- lighter background
  base02 = "#393939", -- selection background (paler)
  base03 = "#484848", -- comments, invisibles
  base04 = "#6b6b6b", -- dark foreground (paler)
  base05 = "#e4e4ef", -- default foreground
  base06 = "#f4f4ff", -- light foreground
  base07 = "#f0f0f0", -- Paler white
  base08 = "#d85f5f", -- Pale red
  base09 = "#e3a376", -- Paler brown
  base0A = "#ffdd33", -- Classes, markup bold (unchanged yellow)
  base0B = "#a5d38c", -- Pale green (strings, markup code)
  base0C = "#acc7b5", -- Paler quartz (support, regular expressions)
  base0D = "#b2c8df", -- Paler blue (functions, methods, headings)
  base0E = "#b7acd8", -- Paler purple (keywords, storage)
  base0F = "#f08282", -- Pale pink for deprecated tags
}

-- Set the theme type
M.type = "dark"

-- Allow users to override the theme
M = require("base46").override_theme(M, "gruber_darker")

-- Custom highlight groups
M.polish_hl = {
  Comment = { fg = M.base_30.orange }, -- toned down brown for comments
  String = { fg = M.base_30.green }, -- pale green for strings
  Keyword = { fg = M.base_30.yellow, bold = false }, -- yellow, less intense
  Constant = { fg = M.base_30.purple }, -- muted wisteria for constants
  Function = { fg = M.base_30.blue }, -- pale niagara for functions
  Variable = { fg = M.base_30.fg1 }, -- muted for variables
  WarningMsg = { fg = M.base_30.red }, -- pale red for warnings
  Type = { fg = M.base_30.teal }, -- quartz
  Identifier = { fg = M.base_30.fg1 },
}

return M

-- -- gruber_darker.lua
--
--
-- local M = {}
--
-- M.base_30 = {
--   white = "#ffffff",
--   black = "#181818", -- nvim bg
--   darker_black = "#101010",
--   black2 = "#282828",
--   one_bg = "#282828",
--   one_bg2 = "#453d41",
--   one_bg3 = "#484848",
--   grey = "#52494e",
--   grey_fg = "#95a99f", -- gruber-darker-quartz
--   grey_fg2 = "#9e95c7", -- gruber-darker-wisteria
--   light_grey = "#f5f5f5",
--   red = "#f43841", -- gruber-darker-red
--   baby_pink = "#ff4f58", -- gruber-darker-red+1
--   pink = "#c73c3f", -- gruber-darker-red-1
--   line = "#282828",
--   green = "#73c936", -- gruber-darker-green
--   vibrant_green = "#73c936",
--   blue = "#96a6c8", -- gruber-darker-niagara
--   nord_blue = "#565f73", -- gruber-darker-niagara-1
--   seablue = "#303540", -- gruber-darker-niagara-2
--   yellow = "#ffdd33", -- gruber-darker-yellow
--   sun = "#cc8c3c", -- gruber-darker-brown
--   purple = "#9e95c7", -- gruber-darker-wisteria
--   dark_purple = "#9e95c7",
--   teal = "#95a99f", -- gruber-darker-quartz
--   orange = "#cc8c3c", -- gruber-darker-brown
--   cyan = "#95a99f", -- gruber-darker-quartz
--   statusline_bg = "#181818",
--   lightbg = "#282828",
--   pmenu_bg = "#73c936",
--   folder_bg = "#96a6c8",
--   fg = "#e4e4ef", -- gruber-darker-fg
--   fg1 = "#f4f4ff", -- gruber-darker-fg+1
--   fg2 = "#f5f5f5", -- gruber-darker-fg+2
-- }
--
-- M.base_16 = {
--   base00 = "#181818", -- background
--   base01 = "#282828", -- lighter background
--   base02 = "#453d41", -- selection background
--   base03 = "#484848", -- comments, invisibles
--   base04 = "#52494e", -- dark foreground
--   base05 = "#e4e4ef", -- default foreground
--   base06 = "#f4f4ff", -- light foreground
--   base07 = "#ffffff", -- white
--   base08 = "#f43841", -- variables, XML tags, markup link text, markup lists, diff deleted
--   base09 = "#cc8c3c", -- integers, boolean, constants, XML attributes, markup link url
--   base0A = "#ffdd33", -- classes, markup bold, search text background
--   base0B = "#73c936", -- strings, inherited class, markup code, diff inserted
--   base0C = "#95a99f", -- support, regular expressions, escape characters, markup quotes
--   base0D = "#96a6c8", -- functions, methods, attribute IDs, headings
--   base0E = "#9e95c7", -- keywords, storage, selector, markup italic, diff changed
--   base0F = "#ff4f58", -- deprecated, opening/closing embedded language tags, e.g. <?php ?>
-- }
--
-- -- Set the theme type
-- M.type = "dark"
--
-- -- Allow users to override the theme
-- M = require("base46").override_theme(M, "gruber_darker")
--
-- -- Custom highlight groups
-- M.polish_hl = {
--   Comment = { fg = M.base_30.orange },
--   String = { fg = M.base_30.green },
--   Keyword = { fg = M.base_30.yellow, bold = true },
--   Constant = { fg = M.base_30.teal },
--   Function = { fg = M.base_30.blue },
--   Variable = { fg = M.base_30.fg1 },
--   WarningMsg = { fg = M.base_30.red },
--   Type = { fg = M.base_30.teal },
--   Identifier = { fg = M.base_30.fg1 },
--   -- Add more highlight groups if necessary
-- }
--
-- return M
