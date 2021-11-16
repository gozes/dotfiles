local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    --use 'vim-airline/vim-airline'
    use 'nvim-lualine/lualine.nvim'
    use 'tpope/vim-fugitive'
    --use 'gruvbox-community/gruvbox'
    use 'airblade/vim-rooter'
    use 'dag/vim-fish'
    use {'fatih/vim-go', run = ':GoUpdateBinaries' }
    --use 'nathanaelkane/vim-indent-guides'
    use 'guns/vim-sexp'
    use 'tpope/vim-sexp-mappings-for-regular-people'
    use 'Olical/conjure'
    use 'cespare/vim-toml'
    --use 'Yggdroot/indentLine'
    use 'tpope/vim-dispatch'
    use 'radenling/vim-dispatch-neovim'
    use 'clojure-vim/vim-jack-in'
    use 'vim-test/vim-test'
    use 'tpope/vim-cucumber'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    --use {'numToStr/Comment.nvim', config = function() require('Comment').setup() end} 
    use {'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup() end} 
    use 'folke/lsp-colors.nvim'
    use 'neovim/nvim-lspconfig'
    use 'preservim/nerdcommenter'
    use 'sainnhe/gruvbox-material'
    use 'onsails/lspkind-nvim'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/nvim-cmp'
    use {'folke/trouble.nvim', requires = 'kyazdani42/nvim-web-devicons'}
    use 'ThePrimeagen/harpoon'
    use 'nvim-lua/popup.nvim'
    use 'tjdevries/astronauta.nvim'
    use 'RishabhRD/lspactions'
    use 'lukas-reineke/indent-blankline.nvim'
    if packer_bootstrap then
        require('packer').sync()
    end
end)
