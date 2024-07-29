-- vim.g.copilot_assume_mapped = true
-- require("copilot").setup({
--     suggestion = { enabled = false },
--     panel = { enabled = false },
-- })

-- vim.keymap.set('i', '<C-H>', 'copilot#Accept()', {
--     expr = true,
--     replace_keycodes = false
-- })
-- vim.g.copilot_no_tab_map = true
-- 
-- vim.g.copilot_filetypes = {
--     ["*"] = false,
--     ["javascript"] = true,
--     ["typescript"] = true,
--     ["lua"] = false,
--     ["rust"] = true,
--     ["c"] = true,
--     ["c#"] = true,
--     ["c++"] = true,
--     ["go"] = true,
--     ["python"] = true,
--   }

local copilot = require("copilot")

copilot.setup({
  suggestion = { enabled = false },
  panel = { enabled = false },
})
