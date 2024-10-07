local null_ls = require "null-ls"

local opts = {
  sources = {
    -- Python
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.diagnostics.ruff,
    -- using conform for formattings
    -- null_ls.builtins.formatting.black,
    -- null_ls.builtins.formatting.isort,

    -- GO
    null_ls.builtins.diagnostics.golangci_lint,
    -- null_ls.builtins.formatting.gofmt,
    -- null_ls.builtins.formatting.goimports,

    -- C#
    -- null_ls.builtins.formatting.csharpier,

    -- C++
    -- null_ls.builtins.formatting.clang_format,
    -- null_ls.builtins.diagnostics.clangd,

    -- General
    null_ls.builtins.code_actions.gitsigns,
    null_ls.builtins.completion.spell,
  },
}

return opts
