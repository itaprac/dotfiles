-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()
local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

-- Common servers   | lua_ls for lua lsp
local servers = { "html", "cssls", "pyright", "gopls", "csharp_ls", "clangd", "lua_ls" }

-- Common setup function
local function setup_server(server_name, extra_config)
  local config = {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }

  if extra_config then
    for k, v in pairs(extra_config) do
      config[k] = v
    end
  end

  lspconfig[server_name].setup(config)
end

-- Setup servers with default configuration
for _, lsp in ipairs(servers) do
  setup_server(lsp)
end

-- Pyright configuration
setup_server("pyright", {
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "workspace",
      },
    },
  },
})

-- Go configuration
setup_server("gopls", {
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
})

-- C# configuration
setup_server("csharp_ls", {
  -- Add any C#-specific settings here if needed
})

-- C++ configuration
-- setup_server("clangd", {
--   -- Add any C++-specific settings here if needed
-- })

-- Lua configuration
setup_server("lua_ls", {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using
        version = "LuaJIT",
        -- Setup your lua path
        path = vim.split(package.path, ";"),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
})
