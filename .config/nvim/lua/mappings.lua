require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

--- Improve navigation between tabs
--- TODO: This does not work
--- map("n", "th", ":tabfirst<CR>")
--- map("n", "tj", ":tabnext<CR>")
--- map("n", "tk", ":tabprev<CR>")
--- map("n", "tl", ":tablast<CR>")

--- Quickly escape the insert mode with jj
map("i", "jj", "<ESC>")

map("n", "<leader>ga", function()
  vim.cmd.RustLsp('codeAction')
end)
