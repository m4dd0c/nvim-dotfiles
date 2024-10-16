return {
  "nvim-telescope/telescope.nvim",
  dependencies = { 'nvim-lua/plenary.nvim' },
  opts = function ()
    return {

    pickers = {
      find_files = {
        hidden = true,
        find_command = {
          "rg",
          "--files",
          "--glob",
          "!{.git/*,.svelte-kit/*,target/*,node_modules/*}",
          "--path-separator",
          "/",
        }
      },
      live_grep = {
           additional_args = function(opts)
             return {
               "--glob",
               "!{.git/*,.svelte-kit/*,target/*,node_modules/*}",
               "--path-separator",
               "/",
             }
           end,
         },
    }
  }
  end,
}
