-- AstroUI provides the basis for configuring the AstroNvim User Interface
---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    colorscheme = "astrotheme",
    highlights = {
      init = {},
    },
    icons = {
      ActiveLSP = "",
      ActiveTS = "",
      BufferClose = "󰅖",
    },
  },
}
