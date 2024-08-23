return {
  {
    "nvim-telescope/telescope-project.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      local conf = require "nvchad.configs.telescope"

      table.insert(conf.extensions_list, "project")

      return conf
    end,
  },
}
