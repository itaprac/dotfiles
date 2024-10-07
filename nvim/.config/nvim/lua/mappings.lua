require "nvchad.mappings"

-- faster keybind setup by using map instead of vim.keymap.set
local map = vim.keymap.set

-- Helper function to create mappings for both normal and visual modes
-- local function map_nv(lhs, rhs, desc)
--   map("n", lhs, rhs, { noremap = true, silent = true, desc = desc })
--   map("v", lhs, rhs, { noremap = true, silent = true, desc = desc })
-- end

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- paste without changing register
map("x", "<leader>p", '"_dP')

-- delete to void
map("n", "<leader>d", '"_d')
map("v", "<leader>d", '"_d')

-- remove "s" map in normal and visual mode
map("n", "s", "<NOP>", { noremap = true, silent = true })
map("v", "s", "<NOP>", { noremap = true, silent = true })

-- press J and K in visual mode to move selected text
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- move cursor when seraching for remain in the same place
map("n", "n", "nwzzzv")
map("n", "N", "Nzzzv")

-- keep separate registers
map("n", "<leader>y", '"+y')
map("n", "<leader>Y", '"+Y')
map("v", "<leader>y", '"+y')

-- copilot
-- disables tab completion
vim.g.copilot_no_tab_map = true
-- Ctr + Y to autocomplete
vim.api.nvim_set_keymap("i", "<C-Y>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

-- Function to toggle Copilot
function ToggleCopilot()
  vim.g.copilot_enabled = not vim.g.copilot_enabled
  print("Copilot " .. (vim.g.copilot_enabled and "enabled" or "disabled"))
end

-- Set up a keybinding to toggle Copilot
vim.api.nvim_set_keymap(
  "n",
  "<leader>ct",
  ":lua ToggleCopilot()<CR>",
  { silent = true, noremap = true, desc = "Toggle Copilot" }
)

-- Undo tree
map("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Zen mode toggle. Currently using NoNeckPain, maybe after terminal switch will swap or just configure zenmode
-- map("n", "<leader>zt", ":ZenMode<CR>", { desc = "Toggle ZenMode" })
vim.api.nvim_create_user_command("ToggleZenModeWithRightSide", function()
  -- Toggle NoNeckPain
  vim.cmd "NoNeckPain"

  -- Set up an autocommand to toggle right side when NoNeckPain is enabled
  vim.cmd [[
        augroup NoNeckPainRightSideToggle
            autocmd!
            autocmd User NoNeckPainEnabled lua vim.cmd('NoNeckPainToggleRightSide')
            autocmd User NoNeckPainEnabled ++once lua vim.cmd('autocmd! NoNeckPainRightSideToggle')
        augroup END
    ]]
end, {})

-- Now map this new command
vim.api.nvim_set_keymap(
  "n",
  "<leader>zt",
  ":ToggleZenModeWithRightSide<CR>",
  { noremap = true, silent = true, desc = "Toggle ZenMode and rightside" }
)
-- map("n", "<leader>zt", ":NoNeckPain<CR>", { desc = "Toggle ZenMode" })
-- map("n", "<leader>zt", ":NoNeckPain<CR>:NoNeckPainToggleRightSide<CR>", { desc = "Toggle ZenMode and rightside" })
map("n", "<leader>zr", ":NoNeckPainToggleRightSide<CR>", { desc = "Toggle ZenMode rightside" })

-- Unmap keys for terminal
vim.api.nvim_del_keymap("n", "<leader>v")
vim.api.nvim_del_keymap("n", "<leader>h")
-- vim.api.nvim_del_keymap("n", "<M-i>")
-- vim.api.nvim_del_keymap("n", "<M-h>")
-- vim.api.nvim_del_keymap("n", "<M-v>")

-- Map window split
vim.api.nvim_set_keymap(
  "n",
  "<leader>v",
  ":vsplit<CR>",
  { noremap = true, silent = true, desc = "Buffer vertical split" }
)

-- vim.api.nvim_set_keymap(
--   "n",
--   "<leader>h",
--   ":split<CR>",
--   { noremap = true, silent = true, desc = "Buffer horizontal split" }
-- )

-- Auto-session keybindings
map("n", "<leader>ss", ":SessionSave<CR>", { noremap = true, silent = true, desc = "Save session (cwd)" })
map("n", "<leader>sS", ":SessionSave ", { noremap = true, desc = "Save named session" })
map("n", "<leader>sr", ":SessionRestore<CR>", { noremap = true, silent = true, desc = "Restore session (cwd)" })
map("n", "<leader>sR", ":SessionRestore ", { noremap = true, desc = "Restore named session" })
map("n", "<leader>sd", ":SessionDelete<CR>", { noremap = true, silent = true, desc = "Delete session (cwd)" })
map("n", "<leader>sD", ":SessionDelete ", { noremap = true, desc = "Delete named session" })
map("n", "<leader>sa", ":SessionDisableAutoSave<CR>", { noremap = true, silent = true, desc = "Disable autosave" })
map("n", "<leader>sA", ":SessionDisableAutoSave!<CR>", { noremap = true, silent = true, desc = "Enable autosave" })
map("n", "<leader>st", ":SessionToggleAutoSave<CR>", { noremap = true, silent = true, desc = "Toggle autosave" })
map("n", "<leader>sp", ":SessionPurgeOrphaned<CR>", { noremap = true, silent = true, desc = "Purge orphaned sessions" })
map("n", "<leader>sf", ":SessionSearch<CR>", { noremap = true, silent = true, desc = "Search sessions (Telescope)" })
map(
  "n",
  "<leader>sF",
  ":Autosession search<CR>",
  { noremap = true, silent = true, desc = "Search sessions (vim.ui.select)" }
)
map(
  "n",
  "<leader>sx",
  ":Autosession delete<CR>",
  { noremap = true, silent = true, desc = "Delete session (vim.ui.select)" }
)

-- Leet Code

-- Leet / Menu
map("n", "<leader>lm", "<cmd>Leet<CR>", { desc = "Open Leet Menu", noremap = true, silent = true })

-- Close the Leetcode.nvim
map("n", "<leader>lx", "<cmd>Leet exit<CR>", { desc = "Close Leet", noremap = true, silent = true })

-- Open console for current question
map("n", "<leader>lc", "<cmd>Leet console<CR>", { desc = "Open Console", noremap = true, silent = true })

-- Info about current question
map("n", "<leader>li", "<cmd>Leet info<CR>", { desc = "Question Info", noremap = true, silent = true })

-- Tabs picker for opened questions
map("n", "<leader>lt", "<cmd>Leet tabs<CR>", { desc = "Open Tabs Picker", noremap = true, silent = true })

-- Yank current question solution
-- map("n", "<leader>ly", "<cmd>Leet yank<CR>", { desc = "Yank Solution", noremap = true, silent = true })

-- Language picker for current question
map("n", "<leader>lg", "<cmd>Leet lang<CR>", { desc = "Change Language", noremap = true, silent = true })

-- Run current question
-- map("n", "<leader>lr", "<cmd>Leet run<CR>", { desc = "Run Question", noremap = true, silent = true })

-- Test (same as run)
map("n", "<leader>lt", "<cmd>Leet test<CR>", { desc = "Test Question", noremap = true, silent = true })

-- Submit current question
map("n", "<leader>ls", "<cmd>Leet submit<CR>", { desc = "Submit Question", noremap = true, silent = true })

-- Random question
-- map("n", "<leader>lr", "<cmd>Leet random<CR>", { desc = "Random Question", noremap = true, silent = true })

-- Today's daily question
-- map("n", "<leader>ld", "<cmd>Leet daily<CR>", { desc = "Daily Question", noremap = true, silent = true })

-- Open problem list picker
map("n", "<leader>lp", "<cmd>Leet list<CR>", { desc = "Problem List Picker", noremap = true, silent = true })

-- Open current question in browser
map("n", "<leader>lo", "<cmd>Leet open<CR>", { desc = "Open in Browser", noremap = true, silent = true })

-- Reset current question to default code
map("n", "<leader>lR", "<cmd>Leet reset<CR>", { desc = "Reset Question", noremap = true, silent = true })

-- Retrieve last submitted code for current question
map("n", "<leader>lls", "<cmd>Leet last_submit<CR>", { desc = "Last Submitted Code", noremap = true, silent = true })

-- Restore default question layout
map("n", "<leader>lrd", "<cmd>Leet restore<CR>", { desc = "Restore Layout", noremap = true, silent = true })

-- Inject code for current question
-- map("n", "<leader>lij", "<cmd>Leet inject<CR>", { desc = "Inject Code", noremap = true, silent = true })

-- Session commands
-- map("n", "<leader>lsc", "<cmd>Leet session create<CR>", { desc = "Create Session", noremap = true, silent = true })
-- map("n", "<leader>lss", "<cmd>Leet session change<CR>", { desc = "Change Session", noremap = true, silent = true })
-- map("n", "<leader>lsu", "<cmd>Leet session update<CR>", { desc = "Update Session", noremap = true, silent = true })

-- Description toggle
map("n", "<leader>ld", "<cmd>Leet desc<CR>", { desc = "Toggle Description", noremap = true, silent = true })

-- Stats visibility toggle
map("n", "<leader>lst", "<cmd>Leet stats<CR>", { desc = "Toggle Stats Visibility", noremap = true, silent = true })

-- Cache update
-- map("n", "<leader>lcch", "<cmd>Leet cache update<CR>", { desc = "Update Cache", noremap = true, silent = true })

-- HOP
local hop = require "hop"
local directions = require("hop.hint").HintDirection
vim.keymap.set("", "f", function()
  hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = true }
end, { remap = true })
vim.keymap.set("", "F", function()
  hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = true }
end, { remap = true })
vim.keymap.set("", "t", function()
  hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 }
end, { remap = true })
vim.keymap.set("", "T", function()
  hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 }
end, { remap = true })

map("n", "<leader>hw", "<cmd>HopWord<CR>", { desc = "Hop Word" })
map("n", "<leader>hc", "<cmd>HopCamelCase<CR>", { desc = "Hop CamelCase" })
map("n", "<leader>hh", "<cmd>HopChar1<CR>", { desc = "Hop Char1" })
map("n", "<leader>h1", "<cmd>HopChar1<CR>", { desc = "Hop Char1" })
map("n", "<leader>h2", "<cmd>HopChar2<CR>", { desc = "Hop Char2" })
map("n", "<leader>hp", "<cmd>HopPattern<CR>", { desc = "Hop Pattern" })
map("n", "<leader>hl", "<cmd>HopLine<CR>", { desc = "Hop Line" })
map("n", "<leader>hs", "<cmd>HopLineStart<CR>", { desc = "Hop Line Start" })
map("n", "<leader>ha", "<cmd>HopAnywhere<CR>", { desc = "Hop Anywhere" })
map("n", "<leader>hn", "<cmd>HopNodes<CR>", { desc = "Hop Nodes" })
map("n", "<leader>hp", "<cmd>HopPaste<CR>", { desc = "Hop Paste" })
map("n", "<leader>hy", "<cmd>HopYankChar1<CR>", { desc = "Hop Yank Char1" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- -- Copilot Chat Keybindings
-- -- Toggle chat window (normal mode only)
-- map("n", "<leader>gct", "<cmd>CopilotChatToggle<CR>", { noremap = true, silent = true, desc = "Toggle Copilot Chat" })
--
-- -- Reset chat window (normal mode only)
-- map("n", "<leader>gcr", "<cmd>CopilotChatReset<CR>", { noremap = true, silent = true, desc = "Reset Copilot Chat" })
--
-- -- Show debug information (normal mode only)
-- map(
--   "n",
--   "<leader>gcd",
--   "<cmd>CopilotChatDebugInfo<CR>",
--   { noremap = true, silent = true, desc = "Copilot Chat Debug Info" }
-- )
--
-- -- Commands that work in both normal and visual modes
-- map_nv("<leader>gce", "<cmd>CopilotChatExplain<CR>", "Copilot Chat Explain")
-- map_nv("<leader>gcv", "<cmd>CopilotChatReview<CR>", "Copilot Chat Review")
-- map_nv("<leader>gcf", "<cmd>CopilotChatFix<CR>", "Copilot Chat Fix")
-- map_nv("<leader>gco", "<cmd>CopilotChatOptimize<CR>", "Copilot Chat Optimize")
-- map_nv("<leader>gcg", "<cmd>CopilotChatDocs<CR>", "Copilot Chat Generate Docs")
-- map_nv("<leader>gcs", "<cmd>CopilotChatTests<CR>", "Copilot Chat Generate Tests")
--
-- -- Fix diagnostic (normal mode only, as it typically works on the current line or buffer)
-- map_nv("<leader>gcx", "<cmd>CopilotChatFixDiagnostic<CR>", "Copilot Chat Fix Diagnostic")
--
-- -- Write commit message (normal mode only)
-- map(
--   "n",
--   "<leader>gcm",
--   "<cmd>CopilotChatCommit<CR>",
--   { noremap = true, silent = true, desc = "Copilot Chat Commit Message" }
-- )
