return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter.install').compilers = { 'zig', 'clang' }
  end
}
