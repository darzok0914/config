" Keybindings.
"
" Hierarchy:
"
" - window
"   - 1..9 for window jump
" - bookmark
"   - list bookmarks
"   - add unannotated bookmark
"   - add annotated bookmarks
"   - delete bookmarks in current file
"   - delete all bookmarks
" - extensions
"   - list them all
" - git
"   - fold / unfold
"   - status
"   - blame under cursor
"   - blame buffer
"   - blame lensline
"   - preview hunk
"   - previous hunk
"   - next hunk
"   - unstage hunk
"   - stage hunk
"   - buffer commits
" - project
"   - diagnostics
"   - code action
"   - code fix
"   - show type definition
"   - show documentation
"   - show references
"   - search for symbol in current buffer
"   - search for symbol in worspace
"   - find file in project
"   - find file in project (versioned)
" - tree
"   - open tree viewer
" - snippets
"   - edit snippets for the current mode
"   - search for a snippet
" - search
"   - search for something in lines of current buffer
"   - search for something in workspace
" - misc

let mapleader=' '
let maplocalleader = ','

let g:which_key_map = { 'name': 'top level' }
let g:which_key_local_map = { 'name': 'local' }

" WhichKey
nnoremap <silent> <leader>      :WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :WhichKey ','<CR>

" misc
noremap U :redo<CR>

let g:which_key_map['#'] = 'hi group at cursor'
nmap <leader># :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Window numbering
let i = 1
while i <= 9
    execute 'nnoremap <silent> w' . i . ' :' . i . 'wincmd w<CR>'
    let i = i + 1
endwhile

" next / prev vim like
inoremap <silent> <C-s> <C-p>
inoremap <silent> <C-t> <C-n>

" commentary
map <silent> <leader>/ :Commentary<CR>
let g:which_key_map['/'] = '(un)comment line'

" bookmarks.
nmap <silent> <leader>.. :CocFzfList bookmark<CR>
nmap <silent> <leader>.a :CocCommand bookmark.toggle<CR>
nmap <silent> <leader>.A :CocCommand bookmark.annotate<CR>
nmap <silent> <leader>.d :CocCommand bookmark.clearForCurrentFile<CR>
nmap <silent> <leader>.D :CocCommand bookmark.clearForAllFiles<CR>
let g:which_key_map['.']   = { 'name': '+bookmarks' }
let g:which_key_map['.']['.'] = 'list bookmarks'
let g:which_key_map['.'].a = 'add bookmark'
let g:which_key_map['.'].A = 'annotate bookmark'
let g:which_key_map['.'].d = 'clear (current file)'
let g:which_key_map['.'].D = 'clear (all files)'

" extensions
map <silent> <leader>em :CocFzfList marketplace<CR>
let g:which_key_map.e   = { 'name': '+extension' }
let g:which_key_map.e.m = 'marketplace'

" git
noremap <silent> <leader>gcc :Gcommit<CR>
noremap <silent> <leader>gcl :BCommits<CR>
noremap <silent> <leader>gi  :GitGutterFold<CR>
noremap <silent> <leader>gg  :Git<CR>
noremap <silent> <leader>gbc :GitMessenger<CR>
noremap <silent> <leader>gbb :Gblame<CR>
noremap <silent> <leader>gbl :ToggleBlameLine<CR>
noremap <silent> <leader>gh  :GitGutterPreviewHunk<CR>
noremap <silent> <leader>gp  :GitGutterPrevHunk<CR>
noremap <silent> <leader>gn  :GitGutterNextHunk<CR>
noremap <silent> <leader>gs  :GitGutterStageHunk<CR>
noremap <silent> <leader>gx  :GitGutterUndoHunk<CR>
noremap <silent> <leader>gw  :Gwrite<CR>
let g:which_key_map.g     = { 'name': '+git'     }
let g:which_key_map.g.i   = 'isolate changes'
let g:which_key_map.g.b   = { 'name': '+blame'   }
let g:which_key_map.g.c   = { 'name': '+commits' }
let g:which_key_map.g.c.c = 'commit'
let g:which_key_map.g.c.l = 'buffer commits'
let g:which_key_map.g.b.c = 'cursor'
let g:which_key_map.g.b.b = 'buffer'
let g:which_key_map.g.b.l = 'lens'
let g:which_key_map.g.g   = 'status'
let g:which_key_map.g.h   = 'preview hunk'
let g:which_key_map.g.p   = 'previous'
let g:which_key_map.g.n   = 'next'
let g:which_key_map.g.s   = 'stage hunk'
let g:which_key_map.g.x   = 'discard hunk'
let g:which_key_map.g.w   = 'hunk whole file'

" code
nmap <silent> <leader>ca :CocCommand actions.open<CR>
nmap <silent> <leader>cd <Plug>(coc-definition)
nmap <silent> <leader>ccp :ContextPeek<CR>
nmap <silent> <leader>cct :ContextToggle<CR>
nmap <silent> <leader>cD <Plug>(coc-references)
nmap <silent> <leader>cf <Plug>(coc-fix-current)
nmap <silent> <leader>ci <Plug>(coc-implementation)
nmap <silent> <leader>cl <Plug>(coc-codelens-action)
nmap <silent> <leader>co :CocFzfList outline<CR>
nmap <silent> <leader>cO :Vista coc<CR>
nmap <silent> <leader>cr <Plug>(coc-rename)
nmap <silent> <leader>cR <Plug>(coc-refactor)
nmap <silent> <leader>cs :CocFzfList symbols<CR>
nmap <silent> <leader>cS :call <SID>show_documentation()<CR>
nmap <silent> S          :call <SID>show_documentation()<CR>
nmap <silent> <leader>ct <Plug>(coc-type-definition)
nmap <silent> <leader>cx :CocFzfList diagnostics<CR>
nmap <silent> <leader>c- :CocFzfListResum<CR>

let g:which_key_map.c = { 'name': '+code' }
let g:which_key_map.c['-'] = 'hi group at cursor'
let g:which_key_map.c.a = 'code action'
let g:which_key_map.c.c = { 'name': '+context' }
let g:which_key_map.c.c.p = 'peek'
let g:which_key_map.c.c.t = 'toggle'
let g:which_key_map.c.d = 'go to definition'
let g:which_key_map.c.D = 'go to references'
let g:which_key_map.c.f = 'code fix'
let g:which_key_map.c.i = 'go to implementations'
let g:which_key_map.c.l = 'lens action'
let g:which_key_map.c.o = 'outline'
let g:which_key_map.c.r = 'rename'
let g:which_key_map.c.R = 'refactor'
let g:which_key_map.c.s = 'workspace symbols'
let g:which_key_map.c.S = 'show documentation'
let g:which_key_map.c.t = 'go to type definition'
let g:which_key_map.c.x = 'diagnostics'

" file
noremap <silent> <leader><leader> :GFiles<CR>
noremap <silent> <leader>fd       :Ex<CR>
noremap <silent> <leader>ff       :Files<CR>
noremap <silent> <leader>fca      :e ~/.config/alacritty/alacritty.yml<CR>
noremap <silent> <leader>fcb      :e ~/.config/bspwm/bspwmrc<CR>
noremap <silent> <leader>fcc      :CocConfig<CR>
noremap <silent> <leader>fci      :e ~/.ssh/config<CR>
noremap <silent> <leader>fci      :e $MYVIMRC<CR>
noremap <silent> <leader>fck      :e ~/.config/nvim/key_bindings.vim<CR>
noremap <silent> <leader>fcp      :e ~/.config/nvim/plug.vim<CR>
noremap <silent> <leader>fcs      :e ~/.config/starship.toml<CR>
noremap <silent> <leader>fct      :e ~/.tmux.conf<CR>
noremap <silent> <leader>fcx      :e ~/.config/sxhkd/sxhkdrc<CR>
noremap <silent> <leader>fcz      :e ~/.zshrc<CR>
noremap <silent> <leader>fcZ      :e ~/.zprofile<CR>
noremap <silent> <leader>fh       :History<CR>
let g:which_key_map.f      = { 'name': '+file' }
let g:which_key_map[' ']   = 'find git file'
let g:which_key_map.f.d    = 'filer'
let g:which_key_map.f.f    = 'find file'
let g:which_key_map.f.c    = { 'name': '+config' }
let g:which_key_map.f.c.a  = 'alacritty'
let g:which_key_map.f.c.b  = 'bspwm'
let g:which_key_map.f.c.c  = 'coc'
let g:which_key_map.f.c.h  = 'ssh'
let g:which_key_map.f.c.i  = 'init'
let g:which_key_map.f.c.k  = 'keybindings'
let g:which_key_map.f.c.p  = 'plugins'
let g:which_key_map.f.c.s  = 'starship'
let g:which_key_map.f.c.t  = 'tmux'
let g:which_key_map.f.c.x  = 'sxhkd'
let g:which_key_map.f.c.z  = 'zsh'
let g:which_key_map.f.c.Z  = 'zprofile'
let g:which_key_map.f.h    = 'history'

noremap <silent> <leader>on :e ~/org/notes.org<CR>
noremap <silent> <leader>od :call OpenDailyNote()<CR>
noremap <silent> <leader>ot :OrgAgendaTodo<CR>
let g:which_key_map.o     = { 'name': '+org' }
let g:which_key_map.o.d   = 'open daily notes'
let g:which_key_map.o.n   = 'open notes'
let g:which_key_map.o.t   = 'open all todos'

function! OpenDailyNote()
  let l:path = strftime("~/org/notes/%b_%d_%Y.md")
  execute "edit " . l:path
endfunction

" toggle and switch
noremap <silent> <leader>tf :Defx -split=vertical -toggle -listed -resume -floating-preview -columns=git:mark:indent:icons:filename:space:size:type:time<CR>
noremap <silent> <leader>tc :Colors<CR>
let g:which_key_map.t   = { 'name': '+toggle & switch' }
let g:which_key_map.t.f = 'file tree'
let g:which_key_map.t.c = 'colorscheme'

" snippets
noremap <silent> <leader>is :CocFzfList snippets<CR>
noremap <silent> <leader>ie :UltiSnipsEdit<CR>
let g:which_key_map.i   = { 'name': '+insert' }
let g:which_key_map.i.s = 'snippets'
let g:which_key_map.i.e = 'edit snippets'

" buffer
noremap <silent> <leader>bb :Buffers<CR>
noremap <silent> <leader>bd :bdel<CR>
noremap <silent> <leader>bD :bdel!<CR>
noremap <silent> <leader>bn :new<CR>
nmap    <silent> <leader>bN :tabnew<CR>
noremap <silent> <leader>bv :vnew<CR>
vmap    <silent> <leader>bv :NarrowRegion<CR>
nmap    <silent> <leader>bc :tabp<CR>
nmap    <silent> <leader>br :tabn<CR>
noremap <silent> <leader>bs :w<CR>
noremap <silent> <leader>bS :w!<CR>
let g:which_key_map.b   = { 'name': '+buffer' }
let g:which_key_map.b.b = 'find buffer'
let g:which_key_map.b.d = 'delete buffer'
let g:which_key_map.b.D = 'delete buffer (force)'
let g:which_key_map.b.n = 'new horizontal buffer'
let g:which_key_map.b.N = 'new tab buffer'
let g:which_key_map.b.c = 'previous tab'
let g:which_key_map.b.r = 'next tab'
let g:which_key_map.b.s = 'save buffer'
let g:which_key_map.b.S = 'save buffer (force)'
let g:which_key_map.b.v = 'new vertical buffer'

" session
noremap <silent> <leader>sc :SClose<CR>
noremap <silent> <leader>sd :SDelete<CR>
noremap <silent> <leader>sl :SLoad<CR>
noremap <silent> <leader>ss :SSave<CR>
let g:which_key_map.s  = { 'name': '+session' }
let g:which_key_map.s.c = 'close session'
let g:which_key_map.s.d = 'delete session'
let g:which_key_map.s.l = 'load session'
let g:which_key_map.s.s = 'save session'

" ripgrep
noremap <silent> <leader>rc :Commands<CR>
noremap <silent> <leader>rf :Filetypes<CR>
noremap <silent> <leader>rl :BLines<CR>
noremap <silent> <leader>rm :Marks<CR>
noremap <silent> <leader>rr :Rg<CR>
let g:which_key_map.r   = { 'name': '+ripgrep' }
let g:which_key_map.r.c = 'commands'
let g:which_key_map.r.f = 'file types'
let g:which_key_map.r.m  = 'marks'
let g:which_key_map.r.l = 'buffer lines'
let g:which_key_map.r.r = 'ripgrep'

" colorizer
nnoremap <silent> <leader>h :ColorizerToggle<CR>
let g:which_key_map.h = 'highlight colors'

" Convenient text objects
omap ic <Plug>(GitGutterTextObjectInnerPending)
omap ac <Plug>(GitGutterTextObjectOuterPending)
xmap ic <Plug>(GitGutterTextObjectInnerVisual)
xmap ac <Plug>(GitGutterTextObjectOuterVisual)

nmap <silent> <leader>w <Plug>(easymotion-bd-w)
nmap <silent> <leader>W <Plug>(easymotion-overwin-w)
nmap <silent> <leader>é <Plug>(easymotion-bd-f)
nmap <silent> <leader>É <Plug>(easymotion-overwin-f)
nmap <silent> <leader>l <Plug>(easymotion-bd-jk)
nmap <silent> <leader>L <Plug>(easymotion-overwin-line)
let g:which_key_map.w = 'go to word'
let g:which_key_map.W = 'go to word everywhere'
let g:which_key_map['é'] = 'go to char'
let g:which_key_map['É'] = 'go to char everywhere'
let g:which_key_map.l = 'go to line'
let g:which_key_map.L = 'go to line everywhere'

" coc.vim function
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<s-tab>'

inoremap <silent><expr> <C-Space> coc#refresh()
inoremap <silent><expr> <C-y> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" clap
autocmd FileType clap_input inoremap <silent> <buffer> <C-t> <C-R>=clap#navigation#linewise('down')<CR>
autocmd FileType clap_input inoremap <silent> <buffer> <C-s> <C-R>=clap#navigation#linewise('up')<CR>

" markdown-preview
nmap <silent> <localleader>p :MarkdownPreview<CR>
nmap <silent> <localleader>P :MarkdownPreviewStop<CR>

" aerojump
nmap <leader>ja :AnyJump<CR>
nmap <leader>jb <Plug>(AerojumpBolt)
nmap <leader>jc <Plug>(AerojumpFromCursorBolt)
nmap <leader>jj <Plug>(AerojumpDefault)
nmap <leader>jl :AnyJumpLastResults<CR>
nmap <leader>js <Plug>(AerojumpSpace)
let g:which_key_map.j = { 'name': '+jump' }
let g:which_key_map.j.a = 'anyjump'
let g:which_key_map.j.b = 'bolt'
let g:which_key_map.j.c = 'from cursor bolt'
let g:which_key_map.j.j = 'default'
let g:which_key_map.j.s = 'space'

" surround
nmap <silent> ds  <Plug>Dsurround
nmap <silent> ls  <Plug>Csurround
nmap <silent> lS  <Plug>CSurround
nmap <silent> ys  <Plug>Ysurround
nmap <silent> yS  <Plug>YSurround
nmap <silent> yss <Plug>Yssurround
nmap <silent> ySs <Plug>YSsurround
nmap <silent> ySS <Plug>YSSurround
vmap <silent> ls  <Plug>Vsurround
vmap <silent> gS  <Plug>VgSsurround

" Narrow region
nmap <silent> <leader>nw :WR!<CR>
xmap <silent> nr :NRV!<CR>
let g:which_key_map.n = { 'name': '+narrow' }
let g:which_key_map.n.w = 'widen region'

" marks
nmap <silent> <leader>ma m
nmap <silent> <leader>ml :Marks<CR>
nmap <silent> <leader>mg '
nmap <silent> <leader>mD :delmarks!<CR>
let g:which_key_map.m = { 'name': '+marks' }
let g:which_key_map.m.a = 'add a new mark'
let g:which_key_map.m.l = 'list all marks'
let g:which_key_map.m.g = 'go to a mark'
let g:which_key_map.m.D = 'delete all marks in the current buffer'
