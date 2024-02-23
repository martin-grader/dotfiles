syntax on
set encoding=utf-8
set number
set relativenumber
set background=dark
set hlsearch
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
set noro

let g:mapleader=','

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Copy to system clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p

""make vim save and load the folding of the document each time it loads"
""also places the cursor in the last place that it was left."
"au BufWinLeave * mkview
"au BufWinEnter * silent loadview
"
"" Indents"
filetype plugin indent on

set tabstop     =4
set softtabstop =4
set shiftwidth  =4
set expandtab

" Window movement"
nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

"Buffer handling"
nnoremap <Leader>n :bnext<CR>
nnoremap <Leader>p :bprevious<CR>

" Nerdtree"
nnoremap <C-t> :NERDTreeToggle<CR>

" tmux
nmap <Leader>m :w<CR>:!tmux send-keys -t test:1.1 C-c ;tmux send-keys -t test:1.1 UP C-m<CR><CR>
nmap <Leader>e :w<CR>:!WP=$(tmux display-message -p '\#S:\#I');tmux send-keys -t $WP.2 C-c ;tmux send-keys -t $WP.2 UP C-m<CR><CR>
nmap <Leader>t :w<CR>:!WP=$(tmux display-message -p '\#S:\#I');tmux send-keys -t $WP.3 C-c ;tmux send-keys -t $WP.3 UP C-m<CR><CR>

function!Set_Python_Actions()
    :CocCommand ruff.executeOrganizeImports
    :CocCommand ruff.executeFormat
endfunction
"autocmd BufWrite *.py call Set_Python_Actions()

"
" Statusline
"
"function! HighlightSearch()
"  if &hls
"    return 'H'
"  else
"    return ''
"  endif
"endfunction
"
"set statusline=
""set statusline+=%7*\[%n]                                  "buffernr
""set statusline+=%1*\ %<%F\                                "File+path
""set statusline+=%2*\ %y\                                  "FileType
""set statusline+=%3*\ %{''.(&fenc!=''?&fenc:&enc).''}      "Encoding
""set statusline+=%3*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
""set statusline+=%4*\ %{&ff}\                              "FileFormat (dos/unix..) 
""set statusline+=%5*\ %{&spelllang}\%{HighlightSearch()}\  "Spellanguage & Highlight on?
""set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
""set statusline+=%9*\ col:%03c\                            "Colnr
""set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.

let g:python_highlight_all = 1

"let g:autopep8_max_line_length=120
"let g:autopep8_on_save = 1
"let g:autopep8_disable_show_diff=1

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'

    Plug 'scrooloose/nerdtree' 
    Plug 'Xuyuanp/nerdtree-git-plugin'
"    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

    Plug 'airblade/vim-gitgutter'

"    Plug 'ryanoasis/vim-devicons'
"    Plug 'ryanoasis/nerd-fonts'

    Plug 'junegunn/fzf'

    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    Plug 'jiangmiao/auto-pairs'

    Plug 'vim-python/python-syntax'
    Plug 'morhetz/gruvbox' 

"    Plug 'tell-k/vim-autopep8'
"    Plug 'dense-analysis/ale'

    Plug 'nathanaelkane/vim-indent-guides'

    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    Plug 'puremourning/vimspector'

    Plug 'preservim/nerdcommenter'

    Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
    Plug 'junegunn/fzf.vim'

    Plug 'tpope/vim-fugitive'

    Plug 'iamcco/markdown-preview.nvim'

    Plug 'hashivim/vim-terraform'
call plug#end()

set background=dark
colorscheme gruvbox

nnoremap <C-t> :NERDTreeToggle<CR>
set cursorline
set scrolloff=5


set history=1000
set laststatus=2
set linebreak
set listchars=tab:>\                            " > to highlight <Tab>"
"set list                                        " displaying listchars
"set mouse=                                      " disable mouse


let g:airline_powerline_fonts = 1
" Indents
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1


" Vimspector "
let g:vimspector_enable_mappings = 'HUMAN'

" GitGutter
let g:gitgutter_log = 1
let g:gitgutter_grep=''

" fzf 
noremap <Leader>o :Files<CR>
noremap <Leader>i :GFiles<CR>

" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes
" COC "
let g:coc_disable_startup_warning = 1

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
