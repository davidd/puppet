"*** font ***
" Highlight search matches, and set incremental searching on ***
:se guifont=Courier:h18
:winpos 50 50
:se lines=32 columns=100
"*** No toolbar ***
" guioptions (go)
:se go-=T
"*** Cursor ***
highlight Cursor guifg=Black guibg=Orange
highlight iCursor guifg=Black guibg=LightRed
":se gcr=n-v-c:block-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175 
set guicursor=n-v-c:block-Cursor
set guicursor=i:block-iCursor
":se gcr=n-v-c:ver50-nCursor
":se gcr=ve:ver35-nCursor
":se gcr=o:hor50-nCursor
":se gcr=sm:block-nCursor
"":se gcr=i-ci:ver50-iCursor
":se gcr=i-ci:ver25-iCursor
":se gcr=r-cr:hor20-iCursor
"*** Stop cursor blinking in all modes ***
:se gcr=a:blinkon0
" no menu
:se guioptions-=m
