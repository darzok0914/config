let mapleader=","
let maplocalleader = "è"

" misc
noremap U :redo<CR>

" tab key bindings
noremap <C-c> :tabp<CR>
noremap <C-r> :tabn<CR>
noremap <C-n> :tabnew<CR>

" file tree
noremap ,n :NERDTreeToggle<CR>

" fuzzy finders
noremap ,b :Clap buffers<CR>
noremap ,f :Clap files<CR>
"noremap ,t :Tags<CR>
noremap ,T :TagbarToggle<CR>
noremap ,r :Clap grep<CR>

" fuzzy git
noremap ,gb :Gblame<CR>
noremap ,gl :ToggleBlameLine<CR>
noremap ,gc :Clap commits<CR>
noremap ,gf :Clap gfiles<CR>
noremap ,gd :Clap git_diff_files<CR>
noremap ,gt :GitGutterNextHunk<CR>
noremap ,gs :GitGutterPrevHunk<CR>

" error / warning reporting
noremap ,qe :cc!<CR>
noremap ,qn :cn!<CR>
noremap ,qp :cp!<CR>
noremap ,qo :cope<CR>

"noremap k :ALEHover<CR>

nmap ,w <Plug>(easymotion-bd-w)
nmap ,W <Plug>(easymotion-overwin-w)
nmap ,c <Plug>(easymotion-bd-f)
nmap ,C <Plug>(easymotion-overwin-f)
nmap ,l <Plug>(easymotion-bd-jk)
nmap ,L <Plug>(easymotion-overwin-line)
nmap ,/ <Plug>(easymotion-sn)

" zoomin
noremap wz :ZoomWinTabToggle<CR>

" coc.vim
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gs :CocList outline<CR>
nmap <silent> gS :CocList symbols<CR>
nmap <silent> ,x :CocList diagnostics<CR>
inoremap <silent><expr> <c-tab> coc#refresh()
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
