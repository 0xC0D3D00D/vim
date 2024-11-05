return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          ["<Leader>e"] = { desc = "Explorer" },
          ["<Leader>ee"] = { "<Cmd>Neotree toggle<CR>", desc = "Toggle Explorer" },
          ["<Leader>ef"] = { "<Cmd>Neotree reveal left<CR>", desc = "Focus on current file" },
        },
        t = {},
      },
    },
  },
}
