require "nvchad.mappings"

local map = vim.keymap.set
local nomap = vim.keymap.del

map("n", ";", ":", { desc = "CMD enter command mode" })

-- pinky saver
map("i", "kj", "<ESC>")

-- Show top of current context
map("n", "<leader>sc", ":TSContextToggle<CR>", { desc = "TSContext Toggle context" })
map("n", "<leader>sd", ":Nvdash<CR>", { desc = "DASH Show dash" })

-- TODO Ctrl+p signature help in edit mode
-- map("i", "<C-p>", require( )

-- unmap untoggle-able terminal commands
nomap("n", "<leader>v")
nomap("n", "<leader>h")

-- nvim tree focus or close
local nvimTreeFocusOrToggle = function()
  local nvimTree = require "nvim-tree.api"
  local currentBuf = vim.api.nvim_get_current_buf()
  local currentBufFt = vim.api.nvim_get_option_value("filetype", { buf = currentBuf })
  if currentBufFt == "NvimTree" then
    nvimTree.tree.toggle()
  else
    nvimTree.tree.focus()
  end
end
map("n", "<leader>e", nvimTreeFocusOrToggle, { desc = "Open or toggle tree" })

-- gtfo
map("n", "<leader>q", ":qa<CR>")

-- Enable clip board capabilities
vim.g.clipboard = {
  name = "WslClipboard",
  copy = {
    ["+"] = "clip.exe",
    ["*"] = "clip.exe",
  },
  paste = {
    ["+"] = 'pwsh.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    ["*"] = 'pwsh.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
  },
  cache_enabled = 0,
}

-- Custom commands --

-- Edit nvim conf
vim.api.nvim_create_user_command("NV", function()
  -- cd nvim conf
  vim.cmd { cmd = "cd", args = { "~/.config/nvim/" } }
  -- focus tree
  local tree = require "nvim-tree.api"
  tree.tree.focus()
end, {})
