set background=dark
let g:colors_name="princess_theme"

lua package.loaded['lush_theme.princess_theme'] = nil
lua require('lush')(require('lush_theme.princess_theme'))
