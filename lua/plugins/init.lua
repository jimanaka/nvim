local overrides = require("configs.overrides")

return {
  {
  "vhyrro/luarocks.nvim",
  priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
  config = true,
  },
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- }

    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        }
    },

    {
      "mfussenegger/nvim-lint",
      config = function()
        require "configs.lint"
      end,
    },

	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},

	-- {
	-- 	"rust-lang/rust.vim",
	-- 	ft = "rust",
	-- 	init = function()
	-- 		vim.g.rustmft_autosave = 1
	-- 	end,
	-- },

	-- {
	-- 	"simrat39/rust-tools.nvim",
	-- 	ft = "rust",
	-- 	dependencies = "neovim/nvim-lspconfig",
	-- 	opts = function()
	-- 		return require("configs.rust-tools")
	-- 	end,
	-- 	config = function(_, opts)
	-- 		require("rust-tools").setup(opts)
	-- -- 	end,
	-- },

	{
		"mfussenegger/nvim-dap",
	},
}
