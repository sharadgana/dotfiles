" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'stephpy/vim-yaml'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'ekalinin/dockerfile.vim'
Plug 'fatih/vim-go'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'SirVer/ultisnips'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'NLKNguyen/papercolor-theme'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'maralla/completor.vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

set autowrite

set termguicolors
set background=light
syntax on
set number
set hidden " Required for specific actions that require multiple buffers
colorscheme seoul256
hi Cursor ctermbg=15 ctermfg=8
hi iCursor ctermbg=15 ctermfg=8



" Spaces & Tabs {{{
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " tabs are space
set autoindent
set copyindent      " copy indent from the previous line
" }}} Spaces & Tabs

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:LanguageClient_serverCommands = {
    \ 'go': ['go-langserver']
    \ }

"vim-go settings
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1

"end vim-go settings

let g:python2_host_prog = '/usr/local/bin/python'
let g:loaded_python_provider = 1
let g:python3_host_prog = '/usr/local/bin/python3'

" vim-rhubarb
let g:github_enterprise_urls = ['https://git.ouroath.com']

" sourcegraph
nnoremap  h :call LanguageClient_textDocument_hover()
nnoremap  de :call LanguageClient_textDocument_definition()
nnoremap  fr :call LanguageClient_textDocument_references()
nnoremap  r :call LanguageClient_textDocument_rename()
nnoremap  m :call LanguageClient_contextMenu()

" Nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"maralla completor
let g:completor_gocode_binary = "$HOME/workspace/go/bin/gocode"


