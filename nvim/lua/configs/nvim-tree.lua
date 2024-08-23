local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  local map = vim.keymap.set

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  map("n", "<leader>cc", api.tree.change_root_to_parent, opts "Up")
  map("n", "?", api.tree.toggle_help, opts "Help")
  map("n", "<leader>v", api.node.open.vertical, opts "Open: Vertical Split")
  map("n", "<leader>cd", api.tree.change_root_to_node, opts "CD")
  -- map("n", "<leader>e", api.tree.toggle, "Close")
end

return {
  on_attach = my_on_attach,
}
