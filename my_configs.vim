"rebinds semicolon to colon (easier to type)
nmap ; :

" Binds <F2> to toggle pasting as plain text
set pastetoggle=<F2>

" Show the leader key as a command when pressed
set showcmd

" Colorscheme
set background=dark
if has("gui_running")
    colorscheme peaksea
else
    colorscheme peaksea
    let g:colors_name="peaksea"
endif

" Set relative line numbers with current line displayed instead of 0
set rnu
set number

" Folding Stuffs
set foldmethod=syntax
" Don't enable folding by default
set nofoldenable

" Set number of undos
set undolevels=10000

" Set indenting method
set cindent

" Spaces are not better than a tab character
set noexpandtab
set smarttab

" Who wants an 8 character tab?  Not me!
set tabstop=4
set shiftwidth=4
set softtabstop=0

" Use English for spellchecking, but don't spellcheck by default (speed)
if version >= 700
   set spl=en spell
   set nospell
endif

" Cool tab completion stuff
set wildmenu
set wildmode=list:longest,full

" Enable mouse support in console
set mouse=a

" Ignoring case is a fun trick
set ignorecase

" And so is Artificial Intellegence!
set smartcase

" This is totally awesome - remap jj to escape in insert mode.  You'll never type jj anyway, so it's great!
inoremap jj <Esc>
nnoremap JJJJ <Nop>

" (Almost) Force quit from vim (all files)
nnoremap <leader><S-Q> :qa<cr>

" Reload this vim config
nnoremap <leader>r :source ~/.vim_runtime/my_configs.vim<cr>

" Save and make
nnoremap <leader>b :w<cr>:make<space>

" Unmap $ in insert mode
silent! iunmap $1
silent! iunmap $2
silent! iunmap $3
silent! iunmap $4
silent! iunmap $q
silent! iunmap $t
silent! iunmap $e

" Get rid of EX mode
nnoremap Q <nop>

" unnamed buffer
set clipboard+=unnamed

" Redraw
map <F5> :redraw!<cr>

" visual instead of audio bell
set visualbell

" set shell to zsh
set shell=zsh

" 1 line high command line
set cmdheight=1

" YouCompleteMe configs
let g:ycm_global_ycm_extra_conf  = '~/.ycm.py'
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_max_num_candidates = 50
let g:ycm_warning_symbol = '##'
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_auto_trigger = 1
let g:ycm_use_clangd = 0

" YouCompleteMe mappings
nnoremap <c-c>D :YcmDiags<CR>
nnoremap <c-F5> :YcmForceCompileAndDiagnostics<CR>
nnoremap <c-c><F5> :YcmRestartServer<CR>
nnoremap <c-c>g :YcmCompleter GoTo<CR>
nnoremap <c-c>gd :YcmCompleter GoToDeclaration<CR>
nnoremap <c-c>t :YcmCompleter GetType<CR>
nnoremap <c-c>d :YcmCompleter GetDoc<CR>
nnoremap <c-c>f :YcmCompleter FixIt<CR>
nnoremap <c-c><c-f> :YcmCompleter Format<CR>
nnoremap <c-c>o :YcmCompleter OrganizeImports<CR>
nnoremap <F2> :YcmCompleter RefactorRename 
let g:ycm_key_detailed_diagnostics = '<c-c><c-d>'
let g:ycm_key_invoke_completion = '<C-Space>'

" CtrlP settings
let g:ctrlp_switch_buffer = 'et'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_cmd = 'CtrlPLastMode --dir'

" lightline (status line) settings
set noshowmode

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified', 'gitbranch' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head',
      \   'filename': 'LightlineFilename'
      \ },
      \ }

command! LightlineReload call LightlineReload()

function! LightlineReload()
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction

function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction

" vim auto-pairs settings
let g:AutoPairsFlyMode = 0
let g:AutoPairsShrotcutToggle = '<leader>P'

" spell underline
let &t_Cs = "\e[4:3m\e[58:5:1m"
let &t_Ce = "\e[4:0m\e[59m"
hi SpellBad gui=undercurl guisp=Red term=undercurl cterm=undercurl

" spell file
set spellfile=~/.vim_runtime/spell/words.utf-8.add
