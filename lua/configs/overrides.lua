local M = {}

M.whichkey = {
	plugins = {
		triggers_blacklist = {
			i = { "j", "k" },
			v = { "j", "k" },
			n = { "j", "k" },
		},
	},
}

M.treesitter = {
	ensure_installed = {
		"vim",
		"lua",
		"html",
		"css",
		"javascript",
		"tsx",
		"c",
		"markdown",
		"markdown_inline",
		"python",
		"rust",
	},
	indent = {
		enable = true,
		disable = {
			"python",
		},
	},
}

M.mason = {
	ensure_installed = {
		-- lua stuff
		"lua-language-server",
		"stylua",

		-- markdown
		"ltex-ls",
		"cbfmt",

		-- web dev stuff
		"css-lsp",
		"html-lsp",
		"typescript-language-server",
		"deno",
		"prettier",
		"tailwindcss-language-server",

		-- c/cpp stuff
		"clangd",
		"clang-format",

		-- python
		"python-lsp-server",
		"autopep8",

		-- rust
		"rust-analyzer",
	},
}

-- git support in nvimtree
-- M.nvimtree = {
--   git = {
--     enable = true,
--   },
--
--   renderer = {
--     highlight_git = true,
--     icons = {
--       show = {
--         git = true,
--       },
--     },
--   },
-- }
M.nvimtree = {
	git = {
		enable = true,
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	renderer = {
		root_folder_modifier = ":t",
		icons = {
      show = {
        git = true,
      },
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					arrow_open = "",
					arrow_closed = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "",
					staged = "",
					unmerged = "",
					renamed = "➜",
					untracked = "U",
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},
	diagnostics = {
		enable = true,
		show_on_dirs = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	-- renderer = {
	--   highlight_git = true,
	--   icons = {
	--     show = {
	--       git = true,
	--     },
	--   },
	-- },
}

return M
