-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "clangd", "pylsp", "bashls"}
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.pylsp.setup({
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
					ignore = { "E501" },
				},
			},
		},
	},
})

-- lspconfig.tailwindcss.setup({
-- 	filetypes = { "javascript", "typescript", "html", "css" },
-- })
--
-- lspconfig.ltex.setup({
-- 	on_attach = function(client, bufnr)
-- 		on_attach(client, bufnr)
-- 		require("ltex-utils").on_attach(bufnr)
-- 	end,
-- })

-- require("tailwind-sorter").setup({
-- 	on_save_enabled = false, -- If `true`, automatically enables on save sorting.
-- 	on_save_pattern = { "*.html", "*.js", "*.jsx", "*.tsx", "*.twig", "*.hbs", "*.php", "*.heex", "*.astro" }, -- The file patterns to watch and sort.
-- 	node_path = "node",
-- })

-- lspconfig.rust_analyzer.setup {
--   filetypes = { "rust" },
--   root_dir = util.root_pattern("Cargo.toml"),
--   settings = {
--     ['rust-analyzer'] = {
--       cargo = {
--         allFeatures = true
--       }
--     }
--   }
-- }

-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
