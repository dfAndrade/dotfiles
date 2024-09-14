require "nvchad.mappings"

local map = vim.keymap.set
local unmap = vim.keymap.del
local autocmd = vim.api.nvim_create_autocmd

map("n", ";", ":", { desc = "CMD enter command mode" })

-- pinky saver
map("i", "kj", "<ESC>")

-- Show top of current context
map("n", "<leader>sc", "<cmd>TSContextToggle<CR>", { desc = "TSContext Toggle context" })
map("n", "<leader>sd", "<cmd>Nvdash<CR>", { desc = "DASH Show dash" })
map("n", "<leader>tp", "<cmd>Telescope project<CR>", { desc = "Telescope Open projects" })

-- TODO Ctrl+p signature help in edit mode
-- map("i", "<C-p>", require( )

-- unmap untoggle-able terminal commands
unmap("n", "<leader>v")
unmap("n", "<leader>h")

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
map("n", "<leader>q", "<cmd>qa<CR>")

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

-- Function to show diagnostics in a floating window
local function show_diagnostics()
  vim.diagnostic.open_float(nil, { focusable = false })
end

-- Hover for diagnostics
autocmd("CursorHold", { pattern = "*", callback = show_diagnostics })
