local lint = require("lint")

-- Custom cpplint config
-- lint.linters.cpplint = {
--   cmd = "cpplint",
--   stdin = false,
--   args = { "--filter=-legal/copyright", "--quiet" }, -- Optional: customize
--   stream = "stderr",
--   ignore_exitcode = true,
--   parser = require("lint.parser").from_errorformat([[%f:%l: %m]], {
--     source = "cpplint",
--     severity = vim.diagnostic.severity.WARN,
--   }),
-- }
lint.linters.cpplint = {
  cmd = "cpplint",
  stdin = false,
  args = {
    "--filter=-legal/copyright",  -- disables just copyright warnings
    "--linelength=120",           -- optional: override default 80 limit
  },
  stream = "stderr",
  ignore_exitcode = true,
  parser = require("lint.parser").from_errorformat([[%f:%l:  %m]], {
    source = "cpplint",
    severity = vim.diagnostic.severity.WARN,
  }),
}

lint.linters_by_ft = {
  cpp = { "cpplint" },
  c = { "cpplint" },
}

