require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

-- Default simple servers
local servers = { "html", "cssls", "clangd", "pyright", "bashls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- Lazy load rust_analyzer
vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function()
    local util = require("lspconfig.util")
    lspconfig.rust_analyzer.setup {
      filetypes = { "rust" },
      root_dir = function(fname)
        return util.root_pattern("Cargo.toml")(fname)
            or util.find_git_ancestor(fname)
            or vim.loop.cwd()
      end,
      on_attach = nvlsp.on_attach,
      on_init = nvlsp.on_init,
      capabilities = nvlsp.capabilities,
      settings = {
        ["rust-analyzer"] = {
          cargo = { allFeatures = true },
        },
      },
    }
  end,
})

-- Lazy load tsserver (renamed from ts_ls → correct: tsserver)
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
  callback = function()
    lspconfig.tsserver.setup {
      on_attach = nvlsp.on_attach,
      on_init = nvlsp.on_init,
      capabilities = nvlsp.capabilities,
    }
  end,
})

-- Lazy load tailwindcss
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "typescript", "html", "css" },
  callback = function()
    lspconfig.tailwindcss.setup {
      filetypes = { "javascript", "typescript", "html", "css" },
      on_attach = nvlsp.on_attach,
      on_init = nvlsp.on_init,
      capabilities = nvlsp.capabilities,
    }
  end,
})

-- Lazy load pylsp with custom settings
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "python",
--   callback = function()
--     lspconfig.pylsp.setup {
--       on_attach = nvlsp.on_attach,
--       on_init = nvlsp.on_init,
--       capabilities = nvlsp.capabilities,
--       settings = {
--         pylsp = {
--           plugins = {
--             pycodestyle = {
--               ignore = { "E501" },
--             },
--           },
--         },
--       },
--     }
--   end,
-- })

-- Lazy load ltex
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "tex", "text" },
  callback = function()
    lspconfig.ltex.setup {
      on_attach = function(client, bufnr)
        nvlsp.on_attach(client, bufnr)
        require("ltex-utils").on_attach(bufnr)
      end,
      on_init = nvlsp.on_init,
      capabilities = nvlsp.capabilities,
    }
  end,
})

-- Optional: Enable LSP system in Neovim 0.10+
vim.lsp.enable(servers)
