" rebinds semicolon to colon (easier to type)
nmap ; :

" Binds <F2> to toggle pasting as plain text
set pastetoggle=<F2>

" Show the leader key as a command when pressed
set showcmd

" Colorscheme
if has("gui_running")
    set background=dark
    colorscheme peaksea
else
    set background=light
    colorscheme pyte
    let g:colors_name="pyte"
endif

" Set the color of the status line
function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guibg=Cyan ctermfg=6 guifg=Black ctermbg=0
  elseif a:mode == 'r'
    hi statusline guibg=Purple ctermfg=5 guifg=Black ctermbg=0
  else
    hi statusline guibg=DarkRed ctermfg=1 guifg=Black ctermbg=0
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15
set statusline=""
" default the statusline to green when entering Vim
hi statusline guibg=DarkGrey ctermfg=8 guifg=White ctermbg=15
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%y      "filetype
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag

" Puts in the current git status
    if count(g:pathogen_disabled, 'Fugitive') < 1   
        set statusline+=%{fugitive#statusline()}
    endif

" Puts in syntastic warnings
    if count(g:pathogen_disabled, 'Syntastic') < 1  
        set statusline+=%#warningmsg#
        set statusline+=%{SyntasticStatuslineFlag()}
        set statusline+=%*
    endif

set statusline+=\ %=                        " align left
set statusline+=Line:%l/%L[%p%%]            " line X of Y [percent of file]
set statusline+=\ Col:%c                    " current column
set statusline+=\ Buf:%n                    " Buffer number
set statusline+=\ [%b][0x%B]\               " ASCII and byte code under cursor
    
" Set relative line numbers with current line displayed instead of 0
set rnu
set number

" Set autoindent
set autoindent

" Folding Stuffs
set foldmethod=marker

" Spaces are better than a tab character
set expandtab
set smarttab

" Who wants an 8 character tab?  Not me!
set shiftwidth=3
set softtabstop=3

" Use english for spellchecking, but don't spellcheck by default
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


