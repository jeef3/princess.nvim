local lush = require("lush")
local hsl = lush.hsl

local mid_black = hsl("#1d1d26")
local mid_white = hsl("#b3b3d4")
local white = mid_white.lighten(50)

local pink = hsl("#ff3399")
local blue = hsl("#00bfff")
local turquoise = hsl("#00ced1")
local green = hsl("#00d364")
local purple = hsl("#cc66ff")
local orange = hsl("#ffcc66")

local bg = mid_black
local bg_dark = mid_black.darken(20)
local fg = mid_white

local pink_bg = pink.mix(bg, 50).darken(50)
local blue_bg = blue.mix(bg, 50).darken(50)
local turquoise_bg = turquoise.mix(bg, 50).darken(50)
local green_bg = green.mix(bg, 50).darken(50)
local orange_bg = orange.mix(bg, 50).darken(50)

local theme = lush(function(injected_functions)
  local sym = injected_functions.sym

  return {
    Normal({ bg = bg, fg = fg }),

    Cursor({ bg = mid_white }),
    CursorLine({ bg = Normal.bg.lighten(5) }),
    CursorColumn({ CursorLine }),
    ColorColumn({ bg = Normal.bg.darken(10) }),

    Comment({ fg = bg.lighten(30), gui = "italic" }),

    LineNr({ bg = Normal.bg.da(10), fg = Normal.bg.li(30) }),
    CursorLineNr({ bg = CursorLine.bg, fg = Normal.fg.ro(180) }),
    EndOfBuffer({ LineNr, bg = bg }),

    Search({ bg = orange, fg = orange.darken(90) }),
    IncSearch({ bg = Search.bg.ro(-20), fg = Search.fg.da(90) }),

    InsertCursor({ bg = green }),
    VisualCursor({ bg = pink }),
    ReplaceCursor({ bg = orange }),
    CommandCursor({ bg = purple }),

    Visual({ bg = bg.lighten(15) }),

    ErrorMsg({ fg = pink }),
    MsgArea({ bg = bg }),

    VertSplit({ fg = bg.lighten(20), bg = bg }),
    SignColumn({ bg = bg }),

    TabLine({ fg = bg.lighten(30), bg = bg_dark }),
    TabLineSel({ fg = fg.lighten(10), bg = bg, gui = "bold" }),
    TabLineFill({ fg = fg, bg = bg_dark }),
    TabLineSeparatorActive({ fg = pink, bg = bg }),
    TabLineSeparatorInactive({ fg = bg.lighten(30), bg = bg_dark }),
    TabLineModifiedSeparatorActive({ fg = blue, bg = bg }),
    TabLineModifiedSeparatorInactive({ fg = bg.lighten(30), bg = bg_dark }),
    TabLinePaddingActive({ fg = fg, bg = bg }),
    TabLinePaddingInactive({ fg = fg, bg = bg_dark }),
    TabLineModifiedActive({ fg = fg, bg = bg }),
    TabLineModifiedInactive({ fg = fg, bg = bg_dark }),
    TabLineCloseActive({ fg = fg, bg = bg, gui = "bold" }),
    TabLineCloseInactive({ fg = bg.lighten(30), bg = bg_dark, gui = "bold" }),

    StatusLine({ fg = pink }),
    StatusLineNC({ fg = pink.darken(50) }),

    StatusLineNormalA({ fg = white, bg = pink.darken(20) }),
    StatusLineNormalB({ fg = white, bg = bg.lighten(10) }),
    StatusLineNormalC({ fg = bg.lighten(50), bg = bg.lighten(5) }),
    StatusLineInactiveA({ fg = white.darken(30), bg = pink.darken(20) }),
    StatusLineInactiveB({ fg = white.darken(30), bg = bg.lighten(10) }),
    StatusLineInactiveC({ fg = bg.lighten(50), bg = bg.lighten(5) }),
    StatusLineInsert({ fg = white, bg = green.darken(20) }),
    StatusLineReplace({ fg = bg, bg = orange.darken(20) }),
    StatusLineCommand({ fg = white, bg = purple.darken(20) }),

    MatchParen({ bg = blue.darken(70), gui = "bold" }),
    MatchWord({ bg = blue.darken(70), gui = "bold" }),

    Title({ fg = pink, gui = "bold" }),
    MoreMsg({ fg = green, gui = "bold" }),
    NonText({ fg = LineNr.fg.darken(40), gui = "bold" }),

    SpellBad({ gui = "undercurl", sp = pink.darken(30) }),
    SpellCap({ gui = "undercurl", sp = blue.darken(30) }),
    SpellLocal({ gui = "undercurl", sp = purple.darken(30) }),
    SpellRare({ gui = "undercurl", sp = green.darken(30) }),

    Constant({ fg = purple, gui = "bold" }),
    String({ fg = orange }),
    Character({ fg = purple }),
    Number({ fg = purple }),
    Float({ fg = purple }),
    Boolean({ fg = purple }),

    Identifier({ fg = pink }),
    Function({ fg = green }),
    Constructor({ fg = green }),

    Statement({ fg = pink }),
    Conditional({ fg = pink }),
    TSConditional({ fg = pink, gui = "bold" }),
    Repeat({ fg = pink }),
    Label({ fg = pink, gui = "bold" }),
    Operator({ fg = pink }),
    PreProc({ fg = pink, gui = "bold" }),
    Keyword({ fg = blue, gui = "bold italic" }),

    TSConstBuiltin({ fg = purple, gui = "bold" }),
    TSInclude({ fg = pink, gui = "bold" }),

    TSTag({ fg = pink }),
    tsxTag({ fg = pink }),
    tsxTagName({ fg = pink }),
    tsxTSTag({ fg = pink }),
    TSTagAttribute({ fg = green }),
    tsxAttrib({ fg = green }),
    TSTagDelimiter({ fg = fg }),

    Variable({ fg = fg }),
    TSVariable({ fg = fg }),
    TSVariableBuiltin({ fg = orange.darken(30), gui = "bold" }),

    TSConstructor({ fg = fg }),
    tsxTSConstructor({ fg = fg }),

    TSFuncBuiltin({ fg = turquoise }),
    TSPunctBracket({ fg = fg }),
    TSPunctDelimiter({ fg = fg }),

    TSParameter({ fg = orange, gui = "italic" }),

    Type({ fg = fg }),
    TSType({ fg = fg }),
    TSTypeBuiltin({ fg = blue, gui = "italic" }),
    TSProperty({ fg = fg }),
    TSMethod({ fg = green }),

    Pmenu({ fg = fg, bg = bg.lighten(10) }),
    PmenuSbar({ fg = fg, bg = bg.lighten(20) }),
    PmenuThumb({ fg = fg, bg = bg.lighten(30) }),
    PmenuSel({ fg = fg.lighten(10), bg = blue.darken(50), gui = "bold" }),

    CmpItemAbbrDeprecated({ fg = fg }),
    CmpItemAbbrMatch({ fg = blue }),
    CmpItemAbbrMatchFuzzy({ fg = blue }),

    CmpItemKindVariable({ fg = green }),
    CmpItemKindInterface({ fg = green }),
    CmpItemKindText({ fg = green }),
    CmpItemKindFunction({ fg = pink }),
    CmpItemKindMethod({ fg = pink }),
    CmpItemKindKeyword({ fg = fg }),
    CmpItemKindProperty({ fg = fg }),
    CmpItemKindUnit({ fg = fg }),

    DiagnosticError({ fg = pink }),
    DiagnosticDefaultError({ DiagnosticError }),
    DiagnosticUnderlineError({ gui = "undercurl", sp = DiagnosticError.fg }),

    LspDiagnosticsError({ DiagnosticError }),
    LspDiagnosticsSignError({ DiagnosticError }),
    LspDiagnosticsFloatingError({ DiagnosticError }),
    LspDiagnosticsUnderlineError({ DiagnosticUnderlineError }),

    DiagnosticVirtualTextError({
      DiagnosticError,
      bg = DiagnosticError.fg.darken(80),
    }),
    LspDiagnosticsDefaultError({ DiagnosticVirtualTextError }),
    LspDiagnosticsVirtualTextError({ DiagnosticVirtualTextError }),

    DiagnosticWarn({ fg = orange }),
    DiagnosticWarning({ DiagnosticWarn }),
    DiagnosticDefaultWarning({ DiagnosticWarn }),
    LspDiagnosticsWarning({ DiagnosticWarn }),
    LspDiagnosticsSignWarning({ DiagnosticWarn }),
    LspDiagnosticsFloatingWarning({ DiagnosticWarn }),
    DiagnosticUnderlineWarn({ gui = "undercurl", sp = DiagnosticWarn.fg }),
    LspDiagnosticsUnderlineWarning({ DiagnosticUnderlineWarn }),

    DiagnosticVirtualTextWarning({
      DiagnosticWarn,
      bg = DiagnosticWarn.fg.darken(80),
    }),
    LspDiagnosticsDefaultWarning({ DiagnosticVirtualTextWarning }),
    LspDiagnosticsVirtualTextWarning({ DiagnosticVirtualTextWarning }),

    DiagnosticHint({ fg = blue.lighten(50) }),
    DiagnosticDefaultHint({ DiagnosticHint }),
    LspDiagnosticsHint({ DiagnosticHint }),
    LspDiagnosticsSignHint({ DiagnosticHint }),
    LspDiagnosticsFloatingHint({ DiagnosticHint }),
    DiagnosticUnderlineHint({ gui = "undercurl", sp = DiagnosticHint.fg }),
    LspDiagnosticsUnderlineHint({ DiagnosticUnderlineHint }),

    DiagnosticVirtualTextHint({
      DiagnosticHint,
      bg = DiagnosticHint.fg.darken(80),
    }),
    LspDiagnosticsDefaultHint({ DiagnosticVirtualTextHint }),
    LspDiagnosticsVirtualTextHint({ DiagnosticVirtualTextHint }),

    DiagnosticLineNrError({ fg = pink, bg = pink_bg, gui = "bold" }),
    DiagnosticLineNrWarn({ fg = orange, bg = orange_bg, gui = "bold" }),
    DiagnosticLineNrInfo({ fg = blue, bg = blue_bg, gui = "bold" }),
    DiagnosticLineNrHint({ fg = turquoise, bg = blue_bg, gui = "bold" }),

    LspReferenceText({
      bg = bg.lighten(10),
      gui = "underline",
      sp = bg.lighten(30),
    }),
    LspReferenceWrite({
      bg = bg.lighten(10),
      gui = "underline",
      sp = bg.lighten(30),
    }),
    LspReferenceRead({
      bg = bg.lighten(10),
      gui = "underline",
      sp = bg.lighten(30),
    }),

    TelescopeBorder({ fg = purple }),
    TelescopeSelection({
      fg = fg.lighten(10),
      bg = bg.lighten(10),
      gui = "bold",
    }),
    TelescopeSelectionCaret({ fg = purple }),
    TelescopeMatching({ fg = blue }),

    GitGutterAdd({ fg = green, bg = green_bg }),
    GitGutterChange({ fg = blue, bg = blue_bg }),
    GitGutterChangeDelete({ fg = blue, bg = blue_bg }),
    GitGutterDelete({ fg = pink, bg = pink_bg }),

    DiffAdd({ bg = GitGutterAdd.bg }),
    DiffChange({ bg = GitGutterChange.bg }),
    DiffDelete({ fg = Comment.fg }),
    DiffText({ bg = blue_bg.lighten(20) }),

    gitcommitFirstLine({ fg = blue, gui = "bold" }),
    gitcommitBranch({ fg = orange, gui = "bold" }),

    Folded({ fg = Comment.fg, bg = bg.lighten(10), gui = "italic" }),
    FoldColumn({ fg = Comment.fg, bg = bg }),

    cssClassName({ fg = green }),
    cssBraces({ fg = fg }),
    cssDefinition({ fg = blue, gui = "italic" }),
    cssAnimationProp({ cssDefinition }),
    cssBackgroundProp({ cssDefinition }),
    cssMediaProp({ cssDefinition }),
    cssPositioningProp({ cssDefinition }),
    cssFlexibleBoxProp({ cssDefinition }),
    cssFontProp({ cssDefinition }),
    cssTextProp({ cssDefinition }),

    cssAttrRegion({ fg = turquoise }),
    cssFlexibleBoxAttr({ cssAttrRegion }),
    cssMultiColumnAttr({ cssAttrRegion }),
    cssAnimationAttr({ cssAttrRegion }),
    cssTransitionAttr({ cssAttrRegion }),
    cssFunctionName({ cssAttrRegion, gui = "bold" }),

    cssUnitDecorators({ fg = pink, gui = "bold" }),

    cssColor({ fg = purple }),

    cssTSKeyword({ fg = pink, gui = "bold" }),
    cssTSProperty({ fg = green }),

    -- DAP
    DapBreakpoint({ fg = pink }),
    DapBreakpointLine({ bg = pink_bg }),
    DapBreakpointCondition({ fg = blue }),
    DapBreakpointConditionLine({ bg = blue_bg }),
    DapLogPoint({ fg = turquoise }),
    DapLogPointLine({ bg = turquoise_bg }),
    DapStopped({ fg = orange }),
    DapStoppedLine({ bg = orange_bg }),
    DapBreakpointRejected({ fg = pink }),
    DapBreakpointRejectedLine({ bg = pink_bg }),

    -- LSP Saga
    TitleString({ fg = purple }),
    TitleIcon({ fg = purple }),
    SagaBorder({ fg = purple }),
    SagaNormal({ fg = fg, bg = bg }),

    -- Newer syntax
    sym("@conditional.ternary")({ fg = pink, gui = "bold" }),

    sym("@constant.builtin")({ fg = purple, gui = "bold" }),

    sym("@constructor")({ fg = blue }),

    sym("@keyword")({ fg = pink, gui = "bold" }),
    sym("@keyword.function")({ fg = blue, gui = "bold italic" }),
    sym("@keyword.return")({ fg = pink, gui = "bold" }),

    sym("@function.builtin")({ fg = turquoise }),
    sym("@function.call")({ fg = green }),
    sym("@function.css")({ fg = turquoise }),

    sym("@parameter")({ fg = orange, gui = "italic" }),

    sym("@property")({ fg = fg }),
    sym("@property.css")({ fg = blue, gui = "italic" }),

    sym("@punctuation.bracket")({ fg = orange }),
    sym("@punctuation.delimiter")({ fg = fg, gui = "bold" }),
    sym("@punctuation.special")({ fg = pink }),

    sym("@tag")({ fg = pink }),
    sym("@tag.attribute")({ fg = green }),
    sym("@tag.delimiter")({ fg = fg }),

    sym("@text.danger")({ fg = pink, gui = "bold" }),
    sym("@text.todo")({ fg = pink, gui = "bold" }),

    sym("@type.qualifier")({ fg = purple, gui = "bold" }),
    sym("@type.builtin")({ fg = purple, gui = "bold" }),

    sym("@variable")({ fg = fg }),
    sym("@variable.builtin")({ fg = purple, gui = "bold" }),
  }
end)

return theme
