filetype plugin on " Enable plugins

syntax enable "Enable syntax higlighting

" Disable startup message
set shortmess+=I

" Don't do visual bells
set visualbell t_vb=

" Make LaTeX syntax highlighting less painful (faster)
" (http://vim.1045645.n5.nabble.com/LaTeX-syntax-misery-td4814790.html)
syntax sync maxlines=100
syntax sync minlines=20

set history=1000 "Lots of command history
set undolevels=1000 "Lots of un-do levels (I make lots of mistakes.)

set backup " auto-create backup files
"If a local backup directory exists, place backups there,
"otherwise, place them in ~/.vim/backup,
"if that fails, put them locally,
"if that fails (?!) put them in tmp
set backupdir=./.backup.vim,~/.vim/backup,.,/tmp
set undodir=~/.vim/undo " where to put undo files
set directory=./.temp.vim,~/.vim/temp,.,/tmp " directory to place swap files in

" turn off beep
set noerrorbells
set novisualbell
" Output nothing for a visual bell.
set t_vb=

" security stuff
set nomodeline
set noexrc " set we can use local .vimrc
set secure " but lets not go crazy (don't allow dangerous commands)

" Make help files less crazy
" (http://vim.wikia.com/wiki/Mapping_to_quickly_browse_help)
au filetype help :nnoremap <buffer><CR> <c-]>
au filetype help :nnoremap <buffer><Delete> <c-T>

" Incremental search -- The cursor jumps to the nearest match of the current
" search term as it is typed
set incsearch

"Occasionally useful mappings for when one wants to use ii to escape. This
"might be useful if you don't like remapping CAPSLOCK.
"imap ii <ESC>
"vmap ii <ESC>

"" INDENTATION " (fold)
set backspace=indent,eol,start " Intuitive backspacing.
"set list listchars=tab:»·,trail:·,extends:>,precedes:<,nbsp:· " Highlight trailing spaces and tabs
set autoindent " automatic indent new lines
"set expandtab " expand tabs to spaces

" display a pretty line wrap
set wrap linebreak
let &showbreak="\u21aa "
" ↪ 

set textwidth=79
" auto-wrap text using textwidth

set formatoptions=at
"t	Auto-wrap text using textwidth 
"
"a	Automatic formatting of paragraphs.  Every time text is inserted or
"deleted the paragraph will be reformatted.  See |auto-format|.  When the 'c'
"flag is present this only happens for recognized comments.
"
" See <leader>a below

" start wrapping two caracters from window margin
" set wrapmargin=2

"" INDENTATION " (end)

"" AUTO-COMPLETE " (fold)

" When you type the first tab hit will complete as much as possible, the second tab hit will provide a list, the third and subsequent tabs will cycle through completion options so you can complete the file without further keys
set wildmode=longest,list,full
set wildmenu

" Make the Omni complete menu less ugly
" and easier to get to
" highlight Pmenu ctermfg=10 ctermbg=3
imap ,, <C-p>

"" AUTO-COMPLETE " (end)

"" FOLDING " (fold)

" Always remember folds (Using markers makes this redundant. Markers make the
" folds part of the file, and hence there is longer a need to remember them.
" Enable if your don't like folds cluttering your work.)
"au BufWinLeave * mkview
"au BufWinEnter * silent loadview

" Fold based on the presence of `(fold)` and `(end)` in a line. 
" Ths makes folds more portable and stable under moving documents between
" computers
set foldmethod=marker
set foldmarker=(fold),(end)

"Make the fold line less ugly 
highlight TabLine term=bold cterm=bold ctermfg=LightGrey ctermbg=Black
highlight TabLineFill term=bold cterm=bold ctermfg=Black ctermbg=Black
highlight TabLineSel term=bold cterm=bold ctermfg=Green ctermbg=LightBlue

" Make folds less ugly
highlight Folded ctermbg=DarkGrey

"" FOLDING " (end)

"" BUFFERS " (fold)

" Switch between buffers quickly
map <leader>1 :buffer 1<CR>
map <leader>2 :buffer 2<CR>
map <leader>3 :buffer 3<CR>
map <leader>4 :buffer 4<CR>
map <leader>5 :buffer 5<CR>
map <leader>6 :buffer 6<CR>
map <leader>7 :buffer 7<CR>
map <leader>8 :buffer 8<CR>
map <leader>9 :buffer 9<CR>
map <leader>0 :buffer 0<CR>



"Moving through buffers quicker.
"map <Leader>[ :bnext<CR>
"map <Leader>] :bprev<CR>
nnoremap <silent> <Right> :bnext<CR>
nnoremap <silent> <Left> :bprev<CR>

"" BUFFERS " (end)

"" DISPLAY USEFUL INFORMATION " (fold)

" Show amount of stuff selected by a command or the number preceeding a command
" (http://superuser.com/questions/165536/show-command-as-its-being-entered-in-console-vim)
set showcmd

set ruler " Enable a ruler (displays position in file in the bottom right corner)

set number " Automatically number lines (see <Leader>n below)

"" DISPLAY USEFUL INFORMATION " (end)

"" LEADER MAGIC " (fold)

" Toggle numbering
map <Leader>n :set number!<CR>

" Always highlight all the results of a search
" set hlsearch

" Toggle highlighting of search results 
map <leader>H :set invhlsearch<CR>

" Temporarily clear the higlighting of the last search terms
map <leader>h :nohlsearch<CR>

" Check what's up with tabs, buffers, registers
map <leader><leader> :tabs<CR>:registers<CR>:buffers<CR>

"Make the current session file
map <leader>M :mksession! ~/.vim/vim.ses<CR>

" Quickly write
map <leader>w :write<CR>

" Set the relative current working directory to the directory of the file in
" the current window 
map <leader>L :lcd %:h<CR>
"                  %:h <-- The head of the name of the current file

" Display working directory
map <leader>p :pwd<CR>

" Quickly compile LaTeX 
map <leader>c :write <bar> ! pdflatex --shell-escape --enable-write18 % <CR> 
map <leader>C :write <bar> ! pdflatex --shell-escape --enable-write18 % > /dev/null & <CR> 

" Do bibtex too
map <leader>b :write <bar> :! pdflatex % <CR> :! bibtex %:r <CR> :! pdflatex % <CR>

" Quickly compile LaTeX2WP
map <leader>w :write <bar> ! python ~/bin/latex2wp/latex2wp.py % <CR> 

" Close the current buffer
map <leader>D :bdelete<CR>

" Toggle autowrapping
" Stolen from: http://stackoverflow.com/questions/15013133/how-to-toggle-automatic-formatting-with-a-single-keybind-in-vim
nnoremap <leader>a :exe 'set fo'.(&fo=~'a'?'-':'+').'=a'<CR>

"" LEADER MAGIC " (end)

"" SPELLING " (fold)

" ss -- toggle spell check highlighting
" sn -- next spelling error
" sp -- previous spelling erros
" sa -- add a word to the typo list
" s? -- list suggestion

map <leader>ss :setlocal spell!<cr>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"" SPELLING " (end)

" SOME OCCASIONALLY USEFUL THINGS " (fold)

" Wrap stuff with {brackets} in visual mode
" (http://amix.dk/vim/vimrc.html)
vnoremap ${ <esc>`>a}<esc>`<i{<esc>}

" " ^X^F in insert mode will autocomplete filenames (:help compl-filname)

" ci{ is changes the text between matching { ... }

" gq reformats text in a selected range to be in a nicer format. Magic!

"" To get copy and paste rom X11 to work, check for a plus sign 
" vim --version | grep xterm_clipboard

"" How to get ESCAPE and CAPSLOCK to switch in tty1 tty2 etc."(fold)
"" Taken from: http://superuser.com/questions/290115/how-to-change-console-keymap-in-linux
"" 
""	2. Check which keycodes are assigned to your keys:
""$ showkey
""
""       Now press the ESC key and the CAPSLOCK key. The keycodes should show up on the screen. Note the keycodes. On my system the ESC has the keycode 1
""       and CAPSLOCK has the keycode 58. showkey will terminate after 10 seconds of inactivity (at least it does on my ubuntu 10.04).
""    3. Note the names of the ESC and CAPSLOCK keys from dumpkeys:
""$ dumpkeys | grep 1
""...
""keycode   1 = Escape
""...
""$ dumpkeys | grep 58
""...
""keycode  58 = CtrlL_Lock
""...
""
""    4. Note the keymap line from dumpkeys:
""$ dumpkeys | head -1
""keymaps 0-127
""
""    5. Create a keymap file which switches ESC and CAPSLOCK:
""keymaps 0-127
""keycode   1 = CtrlL_Lock
""keycode  58 = Escape
""
""    6. Load the keymap:
""$ sudo loadkeys swap_esc_capslock.kmap

"" How to get ESCAPE and CAPSLOCK to switch in tty1 tty2 etc."(end)

" SOME OCCASIONALLY USEFUL THINGS " (end)

" (EXPERIMENTAL) Quickly access the command line. For the sake of ed.
map <Tab> :

