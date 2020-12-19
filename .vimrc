

" If you open this file in Vim, it'll be syntax highlighted for you.

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).
set scrolloff=6
set clipboard=unnamedplus
" Turn on syntax highlighting.
syntax on

set timeout timeoutlen=5000 ttimeoutlen=100
" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2
set title

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Unbind some useless/annoying default key bindings.
nmap Q :w<ESC> 
" 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a
" Try to prevent bad habits like using the arrow keys for movement. This is
" p> " 'Q' in normal mode enters Ex mode. You almost never want this.

set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set nowrap
set noswapfile
set nobackup
set nowritebackup
set undodir=~/.vim/undodir
set undofile

" Fix splitting
"set splitbelow
"set splitright

:set hlsearch



" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
"inoremap <Left>  <ESC>:echoe "Use h"<CR>
"inoremap <Right> <ESC>:echoe "Use l"<CR>
"inoremap <Up>    <ESC>:echoe "Use k"<CR>
"inoremap <Down>  <ESC>:echoe "Use j"<CR>
":imap ii <ESC>l



call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'chriskempson/base16-vim'
"Plug 'ctrlpvim/ctrlp.vim'
Plug 'mbbill/undotree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'jremmen/vim-ripgrep'
Plug 'sonph/onehalf', {'rtp': 'vim/'}



call plug#end()

colorscheme onehalfdark
set t_Co=256
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

hi Normal guibg=NONE ctermbg=NONE


"let g:ctrlp_user_command= ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
"let g:ctrlp_use_caching=0
"let g:ctrlp_working_path_mode = 'a'

nnoremap <C-l> :Lines<cr> 
let mapleader = " "


nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gp :Gpush<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :Lexplore <CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>

" fzf window
set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf
"let g:fzf_layout = { 'window': {'width': 0.8, 'height': 0.8} }
let $FZF_DEFAULT_OPTS='--reverse'
nnoremap <c-p> :GFiles<CR>
nnoremap <c-_> :Files<CR>





" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

nnoremap <c-d> <s-v>yp
:imap <c-d> <ESC><s-v>ypi
:vmap <c-d> yP<CR>

vnoremap <leader>j :m '>+1<CR>gv=gv
vnoremap <leader>k :m '>-2<CR>gv=gv

nnoremap <S-M> <S-k>
vnoremap <S-J> j
vnoremap <S-K> k
nnoremap <S-J> vj
nnoremap <S-K> vk

"netrw
autocmd VimEnter *
\ Lexplore |
\ execute "wincmd l"

  function! OpenToRight()
    :normal v
    let g:path=expand('%:p')
    :q!
    execute 'belowright vnew' g:path
    :normal <C-w>l
	let dot="."
		
  endfunction

  function! OpenBelow()
    :normal v
    let g:path=expand('%:p')
    :q!
    execute 'belowright new' g:path
    :normal <C-w>l
  endfunction


let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize=25
let g:netrw_liststyle=3

function! NetrwMappings()
	"opens in new tab
	nnoremap <buffer> \ :normal t <CR> :Lexplore <CR> :wincmd l <CR>
    noremap <buffer> V :call OpenToRight()<cr>
    noremap <buffer> <cr> :call OpenToRight()<cr>
    noremap <buffer> H :call OpenBelow()<cr>
endfunction

augroup netrw_mappings
autocmd!
autocmd filetype netrw call NetrwMappings()
augroup END

nnoremap QQ<CR> :q<CR> :q<CR>
"nnoremap <tab> 0i<tab><Esc>
"nnoremap <S-tab> 0i<del><Esc>
"pairs
inoremap ( ()<left>
inoremap {<CR> {<ESC>o}<ESC>O
inoremap [ []<left>

vnoremap <leader>" "zdi"<c-r>z"
vnoremap <leader>' "zdi'<c-r>z'
vnoremap <leader>( "zdi(<c-r>z)
vnoremap <leader>[ "zdi[<c-r>z]
vnoremap <leader>{ "zdi{<c-r>z}

inoremap <expr> <bs> <SID>delpair()
inoremap <expr> ) <SID>escapepair(')')
inoremap <expr> } <SID>escapepair('}')
inoremap <expr> ] <SID>escapepair(']')

inoremap <expr> " <SID>pairquotes('"')
inoremap <expr> ' <SID>pairquotes("'")
function! s:delpair()
	let l:lst = ['""',"''",'{}','[]','()']
	let l:col = col('.')
	let l:line = getline('.')
	let l:chr = l:line[l:col-2 : l:col-1]
	if index(l:lst, l:chr) > -1
		return "\<bs>\<del>"
	else
		let l:chr = l:line[l:col-3:l:col-2]
		if (index(l:lst, l:chr)) > - 1
			return "\<bs>\<bs>"
		endif
		return "\<bs>"
endf

function! s:escapepair(right)
	let l:col = col('.')
	let l:chr = getline('.')[l:col-1]
	if a:right == l:chr 
		return "\<right>"
	else
		return a:right

endf

function! s:pairquotes(pair)
	let l:col = col('.')
	let l:line = getline('.')
	let l:chr = l:line[l:col-1]
	if a:pair == l:chr 
		return "\<right>"
	else
		return a:pair.a:pair."\<left>"

endf

"end of pairs

"inoremap {<CR> {<CR>}<ESC>O
"inoremap {;<CR> {<CR>};<ESC>O

"Space c to turn of highlighting
:nnoremap <silent> <Leader>c :nohlsearch<Bar>:echo<CR>

"Star to stay in current word 
:nnoremap * *N

"Press * and then leader-r to replace all instances globally 
nnoremap <Leader>r :%s///g<Left><Left>

"Press s* to delete word and type a replacement. Then you can press . to
"repeat for the next few words
nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn


" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
" Formatting selected code.
xmap gf  <Plug>(coc-format-selected)
nmap gf  <S-V><Plug>(coc-format-selected)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()


" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Use K to show documentation in preview window.
nnoremap <silent> <c-f> :call <SID>show_documentation()<CR>
imap <silent> <c-f> <ESC>:call <SID>show_documentation()<CR>li

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
  else
	execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

"usual undo in insert mode
nnoremap <C-z> u<ESC>
imap <C-z> <ESC>ui
 
"Java Compile
autocmd FileType java map <F9> :!rm *.class <cr>:set makeprg=javac\ %<CR>:make<CR>
autocmd FileType java map <F12> :!java %:r<CR>
autocmd FileType java map! <F9> <Esc>:set makeprg=javac\ %<CR>:make<CR>
autocmd FileType java map! <F12> <ESC>:!java %:r<CR>
"
"Cpp compile
autocmd FileType cpp map <F9> :set makeprg=g++\ %<CR>:make<CR>
autocmd FileType cpp map <F12> :!./a.out<CR>
autocmd FileType cpp map! <F9> <Esc>:set makeprg=g++\ %<CR>:make<CR>
autocmd FileType cpp map! <F12> <ESC>:!./a.out<CR>

"C compile
autocmd FileType c map <F9> :set makeprg=gcc\ %<CR>:make<CR>
autocmd FileType c map <F12> :!./a.out<CR>
autocmd FileType c map! <F9> <Esc>:set makeprg=gcc\ %<CR>:make<CR>
autocmd FileType c map! <F12> <ESC>:!./a.out<CR>


set errorformat=%A:%f:%l:\ %m,%-Z%p^,%-C%.%#
if exists("current_compiler")
  finish
endif
let current_compiler = "javac"

nmap <leader>y ggVG"+y''


"snippets
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
"auto save
:au FocusLost * silent! wa
