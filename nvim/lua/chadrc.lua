-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

local height = 0.6
local width = 0.8

M.ui = {
  theme = "tokyonight",
  term = {
    hl = "Normal:term,WinSeparator:WinSeparator",
    sizes = { sp = 0.4, vsp = 0.3 },
    float = {
      relative = "editor",
      row = (1 - height) / 2,
      col = (1 - width) / 2,
      width = width,
      height = height,
      border = "single",
    },
  },

  transparency = true,

  nvdash = {
    load_on_startup = true,
    header = {
      "                   ;,_            ,                                  ",
      '                 _uP~"b          d"u,                                ',
      '                dP\'   "b       ,d"  "o                               ',
      '               d"    , `b     d"\'    "b                              ',
      '              l] [    " `l,  d"       lb                             ',
      '              Ol ?     "  "b`"=uoqo,_  "l                            ',
      '            ,dBb "b        "b,    `"~~TObup,_                        ',
      '          ,d" (db.`"         ""     "tbc,_ `~"Yuu,_                  ',
      '        .d" l`T\'  \'=                      ~     `""Yu,               ',
      '      ,dO` gP,                           `u,   b,_  "b7              ',
      '     d?\' ,d" l,                           `"b,_ `~b  "1              ',
      '   ,8i\' dl   `l                 ,ggQOV",dbgq,._"  `l  lb             ',
      '  .df\' (O,    "             ,ggQY"~  , @@@@@d"bd~  `b "1             ',
      ' .df\'   `"           -=@QgpOY""     (b  @@@@P db    `Lp"b,           ',
      '.d(                  _               "ko "=d_,Q`  ,_  "  "b,         ',
      'Ql         .         `"qo,._          "tQo,_`""bo ;tb,    `"b,       ',
      'qQ         |L           ~"QQQgggc,_.,dObc,opooO  `"~~";.   __,7,     ',
      'qp         t\\io,_           `~"TOOggQV""""        _,dg,_ =PIQHib.    ',
      '`qp        `Q["tQQQo,_                          ,pl{QOP"\'   7AFR`    ',
      '  `         `tb  \'""tQQQg,_             p" "b   `          .`Vl\'     ',
      '             "Yb      `"tQOOo,__    _,edb    ` .__           |b;     ',
      '                           `"tQQQOOOOP""`"\\QV;qQObob"`-._`  _l       ',
      '                                """"    ._               oP"         ',
      '                                        `~"\\ic,qggddOOP"             ',
      '                                          ,qP`"""""                  ',
      '                               _        _,p"                         ',
      '       unknown                 "boo,._dP"                            ',
      "                                 `\"7tY~'                             ",
      "                                                                     ",
    },
    buttons = {
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
      -- { "  Bookmarks", "Spc m a", "Telescope marks" },
      { "  Projects", "", "Telescope project" },
      { "  Edit nvim", "NV", "NV" },
    },
  },

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

-- M.plugins = {
--   ["nvim-tree/nvim-tree.lua"] = {
--     override_opts = function ()
--       return require("configs.nvim-tree")
--     end
--   }
-- }

return M
