" Backup Options -> Some People may not want this... it generates extra files
set backup      " Enable Backups
set backupext=.bak  " Add .bak extension to modified files
set patchmode=.orig " Copy original file to with .orig extension Before saving.

" Set Tabs and spacing for PHP as recommended by PEAR and Zend
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" File Type detection
filetype on
filetype plugin on

" Set Auto-indent options
set cindent
set smartindent
set autoindent

" Show lines that exceed 80 characters
"match ErrorMsg '\%120v.\+'

" Show a status bar
set ruler
set laststatus=2

" Show Tab Bar
set showtabline=2

" Set Search options highlight, and wrap search
" set hls is
" set wrapscan
" set ic "ignore case in search

" Enable Spell Checking
" set spell

" Turn on Line numbers
set number

" Enable Code Folding
" set foldenable
" set foldmethod=syntax

colorscheme vividchalk
