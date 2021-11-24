local lush = require('lush')
local hsl = lush.hsl

local mid_black = hsl("#1d1d26")
local mid_white = hsl("#b3b3d4")

local pink      = hsl("#ff3399")
local blue      = hsl("#00bfff")
local turquoise = hsl("#00ced1")
local green     = hsl("#00d364")
local purple    = hsl("#cc66ff")
local orange    = hsl("#ffcc66")

local bg        = mid_black
local bg_dark   = mid_black.darken(20)
local fg        = mid_white

local theme = lush(function()
  return {
    Normal { bg = bg, fg = fg }, -- normal text

    CursorLine { bg = Normal.bg.lighten(5) }, -- Screen-line at the cursor, when 'cursorline' is set.  Low-priority if foreground (ctermfg OR guifg) is not set.
    CursorColumn { CursorLine },

    Comment { fg = bg.lighten(30), gui="italic" },

    LineNr       { bg = Normal.bg.da(10), fg = Normal.bg.li(20) }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr { bg = CursorLine.bg, fg = Normal.fg.ro(180) }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.

    Search       { bg= orange, fg = orange.darken(90) },
    IncSearch    { bg = Search.bg.ro(-20), fg = Search.fg.da(90) },

    InsertCursor    { bg = green },
    VisualCursor    { bg = pink },
    ReplaceCursor   { bg = orange },
    CommandCursor   { bg = purple },

    VertSplit       { fg = bg.lighten(20), bg = bg },
    SignColumn      { bg = bg },

    TabLine                           { fg = bg.lighten(30), bg = bg_dark },
    TabLineSel                        { fg = fg, bg = bg },
    TabLineFill                       { fg = fg, bg = bg_dark },
    TabLineSeparatorActive            { fg = pink, bg = bg },
    TabLineSeparatorInactive          { fg = bg.lighten(30), bg = bg_dark },
    TabLineModifiedSeparatorActive    { fg = blue, bg = bg },
    TabLineModifiedSeparatorInactive  { fg = bg.lighten(30), bg = bg_dark },
    TabLinePaddingActive              { fg = fg, bg = bg },
    TabLinePaddingInactive            { fg = fg, bg = bg_dark },
    TabLineModifiedActive             { fg = fg, bg = bg },
    TabLineModifiedInactive           { fg = fg, bg = bg_dark },
    TabLineCloseActive                { fg = fg, bg = bg, gui = "bold" },
    TabLineCloseInactive              { fg = bg.lighten(30), bg = bg_dark, gui = "bold" },

    SpellBad        { gui = "undercurl", sp = pink.darken(30) },
    SpellCap        { gui = "undercurl", sp = blue.darken(30) },
    SpellLocal      { gui = "undercurl", sp = purple.darken(30) },
    SpellRare       { gui = "undercurl", sp = green.darken(30) },

    Constant        { fg = purple, gui = "bold" },
    String          { fg = orange},
    Character       { fg = purple },
    Number          { fg = purple },
    Float           { fg = purple },
    Boolean         { fg = purple },

    Identifier      { fg = pink },
    Function        { fg = green },
    Constructor     { fg = green },

    Statement       { fg = pink },
    Conditional     { fg = pink },
    TSConditional   { fg = pink, gui = "bold" },
    Repeat          { fg = pink },
    Label           { fg = pink, gui = "bold" },
    Operator        { fg = pink, gui = "bold" },
    PreProc         { fg = pink, gui = "bold" },
    Keyword         { fg = blue, gui = "bold italic" },
    TSKeywordReturn { fg = pink, gui = "bold" },

    TSConstBuiltin  { fg = purple, gui = "bold" },
    TSInclude       { fg = pink, gui = "bold" },

    TSTag           { fg = pink },
    TSTagAttribute  { fg = green },
    TSTagDelimiter  { fg = fg },

    Variable        { fg = fg },
    TSVariable      { fg = fg },
    TSVariableBuiltin      { fg = orange.darken(30), gui = "bold" },

    TSConstructor   { fg = fg },
    tsxTSConstructor   { fg = pink },

    TSFuncBuiltin   { fg = turquoise },
    TSPunctBracket  { fg = fg },
    TSPunctDelimiter{ fg = fg },

    TSParameter     { fg = orange, gui = "italic" },

    TSType          { fg = fg },
    TSTypeBuiltin   { fg = blue, gui = "italic" },
    TSProperty      { fg = fg },
    TSMethod        { fg = green },

    Pmenu           { fg = fg, bg = bg.lighten(3) },
    PmenuSbar       { fg = fg, bg = bg.lighten(10) },
    PmenuThumb      { fg = fg, bg = bg.lighten(20) },
    PmenuSel          { fg = fg.lighten(10), bg = blue.darken(60), gui = "bold" },

    DiagnosticError               { fg = pink },
    DiagnosticDefaultError        { DiagnosticError },
    LspDiagnosticsError           { DiagnosticError },
    LspDiagnosticsSignError       { DiagnosticError },
    LspDiagnosticsFloatingError   { DiagnosticError },
    DiagnosticUnderlineError      { gui = "undercurl", sp = DiagnosticError.fg },
    LspDiagnosticsUnderlineError  { DiagnosticUnderlineError },

    DiagnosticVirtualTextError     { DiagnosticError, bg = DiagnosticError.fg.darken(80) },
    LspDiagnosticsDefaultError     { DiagnosticVirtualTextError },
    LspDiagnosticsVirtualTextError { DiagnosticVirtualTextError  },

    DiagnosticWarn                  { fg = orange },
    DiagnosticWarning               { DiagnosticWarn },
    DiagnosticDefaultWarning        { DiagnosticWarn },
    LspDiagnosticsWarning           { DiagnosticWarn },
    LspDiagnosticsSignWarning       { DiagnosticWarn },
    LspDiagnosticsFloatingWarning   { DiagnosticWarn },
    DiagnosticUnderlineWarn         { gui = "undercurl", sp = DiagnosticWarn.fg },
    LspDiagnosticsUnderlineWarning  { DiagnosticUnderlineWarn },

    DiagnosticVirtualTextWarning     { DiagnosticWarn, bg = DiagnosticWarn.fg.darken(80) },
    LspDiagnosticsDefaultWarning     { DiagnosticVirtualTextWarning },
    LspDiagnosticsVirtualTextWarning { DiagnosticVirtualTextWarning  },

    DiagnosticHint                  { fg = blue.lighten(50) },
    DiagnosticDefaultHint        { DiagnosticHint },
    LspDiagnosticsHint           { DiagnosticHint },
    LspDiagnosticsSignHint       { DiagnosticHint },
    LspDiagnosticsFloatingHint   { DiagnosticHint },
    DiagnosticUnderlineHint         { gui = "undercurl", sp = DiagnosticHint.fg },
    LspDiagnosticsUnderlineHint  { DiagnosticUnderlineHint },

    DiagnosticVirtualTextHint     { DiagnosticHint, bg = DiagnosticHint.fg.darken(80) },
    LspDiagnosticsDefaultHint     { DiagnosticVirtualTextHint },
    LspDiagnosticsVirtualTextHint { DiagnosticVirtualTextHint  },

    TelescopeBorder             { fg = purple },
    TelescopeSelection          { fg = fg.lighten(10), bg = bg.lighten(10), gui = "bold" },
    TelescopeSelectionCaret     { fg = purple },
    TelescopeMatching           { fg = blue },

    GitGutterAdd                { fg = green, bg = green.darken(80) },
    GitGutterChange             { fg = orange, bg = orange.darken(80) },
    GitGutterChangeDelete       { fg = orange, bg = orange.darken(80) },
    GitGutterDelete             { fg = pink, bg = pink.darken(80) },

    cssClassName        { fg = green },
    cssBraces           { fg = fg },
    cssDefinition       { fg = blue, gui = "italic" },
    cssAnimationProp    { cssDefinition },
    cssBackgroundProp   { cssDefinition },
    cssMediaProp        { cssDefinition },
    cssPositioningProp  { cssDefinition },
    cssFlexibleBoxProp  { cssDefinition },
    cssFontProp         { cssDefinition },
    cssTextProp         { cssDefinition },

    cssAttrRegion       { fg = turquoise },
    cssFlexibleBoxAttr  { cssAttrRegion },
    cssMultiColumnAttr  { cssAttrRegion },
    cssAnimationAttr    { cssAttrRegion },
    cssTransitionAttr    { cssAttrRegion },
    cssFunctionName     { cssAttrRegion, gui = "bold" },

    cssUnitDecorators   { fg = pink, gui = "bold" },

    cssColor            { fg = purple },

    cssTSKeyword        { fg = pink, gui = "bold" },
    cssTSProperty       { fg = green },
  }
end)

return theme
