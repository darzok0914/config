" phaazon’s neovim configuration

source ~/.config/nvim/common.vim
source ~/.config/nvim/lang.vim
source ~/.config/nvim/bepo.vim
source ~/.config/nvim/plug.vim
source ~/.config/nvim/key_bindings.vim
source ~/.config/nvim/fzf_extra.vim
source ~/.config/nvim/platform_specific.vim
source ~/.config/nvim/colorscheme.vim

lua require'colorizer'.setup()
lua require('treesitter-config')
lua require('devicons-config')
