vim.g.gitgutter_sign_removed = '▶'
vim.cmd([[
    highlight GitGutterAdd    guifg=#384C38 guibg=#384C38 ctermfg=2 ctermbg=2
    highlight GitGutterChange guifg=#374752 guibg=#374752 ctermfg=3 ctermbg=3
    highlight GitGutterDelete guifg=#656E76 guibg=#3c3836 ctermfg=1 ctermbg=1  
    "highlight GitGutterDelete guifg=#656E76 guibg=#330000 ctermfg=1 ctermbg=1  
    highlight GitGutterChangeDelete guifg=#4c4638 guibg=#4c4638 ctermfg=1 ctermbg=1
]])
