-- ══════════════════════════════════════════════════════════════
--  Super Game Bro — Colorscheme para Neovim / LazyVim
--  Paleta monocromática verde lima, 4 niveles de contraste
-- ══════════════════════════════════════════════════════════════

-- ── Paleta ─────────────────────────────────────────────────────
local c = {
	-- Fondos
	bg_hard = "#0D2A1A", -- negro terminal / fondos floating
	bg = "#214130", -- fondo principal ← FIJO
	bg_light = "#2E5B38", -- visual selection / cursorline

	-- Verdes medios
	dim1 = "#396840", -- números de línea
	dim1b = "#468050", -- comentarios, ui inactivo
	dim2 = "#4A7828", -- strings (normal)
	dim2b = "#5A9030", -- strings (bright)
	dim3 = "#648820", -- punctuation / delimiters
	dim3b = "#78A020", -- parameters / decorators

	-- Foreground
	fg = "#88A827", -- texto normal

	-- Énfasis
	bright1 = "#9CB827", -- tipos, propiedades, funciones
	lime = "#B8D432", -- keywords, selected-text Walker
	bright_lime = "#D4F060", -- constantes, búsqueda activa
}

local function set_hl(highlights)
	for group, opts in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, opts)
	end
end

local function apply()
	vim.opt.background = "dark"
	vim.g.colors_name = "super-game-bro"

	set_hl({
		-- ── Editor base y UI Core (Evita fugas de color blanco) ──
		Normal = { fg = c.fg, bg = c.bg },
		NormalFloat = { fg = c.fg, bg = c.bg_hard },
		NormalNC = { fg = c.fg, bg = c.bg },
		FloatBorder = { fg = c.dim3, bg = c.bg_hard },
		FloatTitle = { fg = c.lime, bg = c.bg_hard, bold = true },
		Title = { fg = c.lime, bold = true }, -- <-- ESTO ARREGLA EL LOGO
		NonText = { fg = c.dim1 },
		SpecialKey = { fg = c.dim3 },
		Directory = { fg = c.bright1, bold = true },

		-- ── Cursor y línea actual ─────────────────────────────────
		Cursor = { fg = c.bg, bg = c.lime },
		CursorLine = { bg = c.bg_hard },
		CursorLineNr = { fg = c.lime, bold = true },
		CursorColumn = { bg = c.bg_hard },
		ColorColumn = { bg = c.bg_hard },

		-- ── Números de línea ──────────────────────────────────────
		LineNr = { fg = c.dim1 },
		LineNrAbove = { fg = c.dim1 },
		LineNrBelow = { fg = c.dim1 },
		SignColumn = { fg = c.dim1, bg = c.bg },

		-- ── Selección visual ──────────────────────────────────────
		Visual = { bg = c.bg_light },
		VisualNOS = { bg = c.bg_light },

		-- ── Búsqueda ─────────────────────────────────────────────
		Search = { fg = c.bg_hard, bg = c.lime },
		IncSearch = { fg = c.bg_hard, bg = c.bright_lime, bold = true },
		CurSearch = { fg = c.bg_hard, bg = c.bright_lime, bold = true },
		Substitute = { fg = c.bg_hard, bg = c.lime },

		-- ── Statusline ────────────────────────────────────────────
		StatusLine = { fg = c.fg, bg = c.bg_hard },
		StatusLineNC = { fg = c.dim1b, bg = c.bg_hard },

		-- ── Tabline ───────────────────────────────────────────────
		TabLine = { fg = c.dim1b, bg = c.bg_hard },
		TabLineSel = { fg = c.lime, bg = c.bg, bold = true },
		TabLineFill = { bg = c.bg_hard },

		-- ── Popup menu (autocompletado) ───────────────────────────
		Pmenu = { fg = c.fg, bg = c.bg_hard },
		PmenuSel = { fg = c.bg_hard, bg = c.lime, bold = true },
		PmenuSbar = { bg = c.bg_light },
		PmenuThumb = { bg = c.dim3 },
		PmenuKind = { fg = c.bright1, bg = c.bg_hard },
		PmenuKindSel = { fg = c.bg_hard, bg = c.lime },
		PmenuExtra = { fg = c.dim2b, bg = c.bg_hard },
		PmenuExtraSel = { fg = c.bg_hard, bg = c.lime },

		-- ── Splits ───────────────────────────────────────────────
		VertSplit = { fg = c.dim1 },
		WinSeparator = { fg = c.dim1 },

		-- ── Fold ──────────────────────────────────────────────────
		Folded = { fg = c.dim1b, bg = c.bg_hard },
		FoldColumn = { fg = c.dim1, bg = c.bg },

		-- ── Mensajes ─────────────────────────────────────────────
		ModeMsg = { fg = c.lime, bold = true },
		MsgArea = { fg = c.fg, bg = c.bg },
		MoreMsg = { fg = c.bright1 },
		Question = { fg = c.lime },
		ErrorMsg = { fg = c.bright_lime, bold = true },
		WarningMsg = { fg = c.bright1 },

		-- ── Matchparen ────────────────────────────────────────────
		MatchParen = { fg = c.bright_lime, bg = c.bg_light, bold = true },

		-- ── Diff ──────────────────────────────────────────────────
		DiffAdd = { fg = c.lime, bg = c.dim1 },
		DiffChange = { fg = c.bright1, bg = c.dim2 },
		DiffDelete = { fg = c.dim3, bg = c.bg_hard },
		DiffText = { fg = c.bright_lime, bg = c.dim2, bold = true },

		-- ── Dashboards Integrados (LazyVim / Snacks / Alpha) ─────
		DashboardHeader = { fg = c.lime },
		DashboardShortcut = { fg = c.bright_lime, bold = true },
		DashboardDesc = { fg = c.fg },
		DashboardFooter = { fg = c.dim1b },

		SnacksDashboardHeader = { fg = c.lime },
		SnacksDashboardIcon = { fg = c.bright_lime },
		SnacksDashboardDesc = { fg = c.fg },
		SnacksDashboardKey = { fg = c.bright_lime, bold = true },
		SnacksDashboardFooter = { fg = c.dim1b },

		-- ── Diagnósticos ──────────────────────────────────────────
		DiagnosticError = { fg = c.bright_lime },
		DiagnosticWarn = { fg = c.lime },
		DiagnosticInfo = { fg = c.bright1 },
		DiagnosticHint = { fg = c.fg },
		DiagnosticOk = { fg = c.dim3b },
		DiagnosticUnderlineError = { undercurl = true, sp = c.bright_lime },
		DiagnosticUnderlineWarn = { undercurl = true, sp = c.lime },
		DiagnosticUnderlineInfo = { undercurl = true, sp = c.bright1 },
		DiagnosticUnderlineHint = { undercurl = true, sp = c.fg },

		-- ── Syntax base ───────────────────────────────────────────
		Comment = { fg = c.dim1b, italic = true },
		Constant = { fg = c.bright_lime },
		String = { fg = c.dim2b },
		Character = { fg = c.dim2b },
		Number = { fg = c.bright_lime },
		Boolean = { fg = c.lime, bold = true },
		Float = { fg = c.bright_lime },

		Identifier = { fg = c.fg },
		Function = { fg = c.bright1 },

		Statement = { fg = c.lime, bold = true },
		Conditional = { fg = c.lime, bold = true },
		Repeat = { fg = c.lime, bold = true },
		Label = { fg = c.lime },
		Operator = { fg = c.fg },
		Keyword = { fg = c.lime, bold = true },
		Exception = { fg = c.bright_lime, bold = true },

		PreProc = { fg = c.dim3b },
		Include = { fg = c.dim3b },
		Define = { fg = c.dim3b },
		Macro = { fg = c.dim3b, italic = true },
		PreCondit = { fg = c.dim3b },

		Type = { fg = c.bright1 },
		StorageClass = { fg = c.lime },
		Structure = { fg = c.bright1 },
		Typedef = { fg = c.bright1 },

		Special = { fg = c.dim3b },
		SpecialChar = { fg = c.dim3b },
		Tag = { fg = c.bright1 },
		Delimiter = { fg = c.dim3 },
		SpecialComment = { fg = c.dim1b, italic = true },
		Debug = { fg = c.bright_lime },

		Underlined = { fg = c.lime, underline = true },
		Ignore = { fg = c.dim1 },
		Error = { fg = c.bright_lime, bold = true, underline = true },
		Todo = { fg = c.bg_hard, bg = c.lime, bold = true },

		-- ── Treesitter ────────────────────────────────────────────
		["@variable"] = { fg = c.fg },
		["@variable.builtin"] = { fg = c.dim3b, italic = true },
		["@variable.parameter"] = { fg = c.dim3b },
		["@variable.member"] = { fg = c.bright1 },

		["@constant"] = { fg = c.bright_lime },
		["@constant.builtin"] = { fg = c.lime, bold = true },
		["@constant.macro"] = { fg = c.dim3b },

		["@string"] = { fg = c.dim2b },
		["@string.escape"] = { fg = c.lime },
		["@string.special"] = { fg = c.dim3b },
		["@string.regexp"] = { fg = c.bright1, italic = true },

		["@number"] = { fg = c.bright_lime },
		["@number.float"] = { fg = c.bright_lime },
		["@boolean"] = { fg = c.lime, bold = true },

		["@function"] = { fg = c.bright1 },
		["@function.builtin"] = { fg = c.bright1, italic = true },
		["@function.call"] = { fg = c.bright1 },
		["@function.macro"] = { fg = c.dim3b },
		["@function.method"] = { fg = c.bright1 },
		["@function.method.call"] = { fg = c.bright1 },

		["@constructor"] = { fg = c.lime },
		["@type"] = { fg = c.bright1 },
		["@type.builtin"] = { fg = c.bright1, italic = true },
		["@type.definition"] = { fg = c.bright1, bold = true },
		["@type.qualifier"] = { fg = c.lime, bold = true },

		["@keyword"] = { fg = c.lime, bold = true },
		["@keyword.coroutine"] = { fg = c.lime, bold = true },
		["@keyword.function"] = { fg = c.lime, bold = true },
		["@keyword.operator"] = { fg = c.lime, bold = true },
		["@keyword.import"] = { fg = c.dim3b, italic = true },
		["@keyword.return"] = { fg = c.lime, bold = true },
		["@keyword.exception"] = { fg = c.bright_lime, bold = true },
		["@keyword.conditional"] = { fg = c.lime, bold = true },
		["@keyword.repeat"] = { fg = c.lime, bold = true },

		["@operator"] = { fg = c.fg },
		["@punctuation.delimiter"] = { fg = c.dim3 },
		["@punctuation.bracket"] = { fg = c.dim3 },
		["@punctuation.special"] = { fg = c.dim3b },

		["@comment"] = { fg = c.dim1b, italic = true },
		["@comment.documentation"] = { fg = c.dim1b, italic = true },
		["@comment.todo"] = { fg = c.bg_hard, bg = c.lime, bold = true },
		["@comment.warning"] = { fg = c.bg_hard, bg = c.bright1, bold = true },
		["@comment.error"] = { fg = c.bg_hard, bg = c.bright_lime, bold = true },

		["@markup.strong"] = { bold = true },
		["@markup.italic"] = { italic = true },
		["@markup.underline"] = { underline = true },
		["@markup.strikethrough"] = { strikethrough = true },
		["@markup.heading"] = { fg = c.lime, bold = true },
		["@markup.heading.1"] = { fg = c.bright_lime, bold = true },
		["@markup.heading.2"] = { fg = c.lime, bold = true },
		["@markup.heading.3"] = { fg = c.bright1, bold = true },
		["@markup.link"] = { fg = c.bright1, underline = true },
		["@markup.link.url"] = { fg = c.dim2b, underline = true },
		["@markup.raw"] = { fg = c.dim2b, bg = c.bg_hard },
		["@markup.list"] = { fg = c.lime },
		["@markup.list.checked"] = { fg = c.dim3b },
		["@markup.list.unchecked"] = { fg = c.dim1b },

		["@tag"] = { fg = c.lime, bold = true },
		["@tag.attribute"] = { fg = c.bright1 },
		["@tag.delimiter"] = { fg = c.dim3 },

		-- ── LSP semantic tokens ───────────────────────────────────
		["@lsp.type.class"] = { fg = c.bright1 },
		["@lsp.type.decorator"] = { fg = c.dim3b, italic = true },
		["@lsp.type.enum"] = { fg = c.bright1 },
		["@lsp.type.enumMember"] = { fg = c.bright_lime },
		["@lsp.type.function"] = { fg = c.bright1 },
		["@lsp.type.interface"] = { fg = c.bright1, italic = true },
		["@lsp.type.keyword"] = { fg = c.lime, bold = true },
		["@lsp.type.macro"] = { fg = c.dim3b },
		["@lsp.type.method"] = { fg = c.bright1 },
		["@lsp.type.namespace"] = { fg = c.dim3b },
		["@lsp.type.parameter"] = { fg = c.dim3b },
		["@lsp.type.property"] = { fg = c.bright1 },
		["@lsp.type.struct"] = { fg = c.bright1 },
		["@lsp.type.type"] = { fg = c.bright1 },
		["@lsp.type.typeParameter"] = { fg = c.bright1, italic = true },
		["@lsp.type.variable"] = { fg = c.fg },

		-- ── Telescope ─────────────────────────────────────────────
		TelescopeNormal = { fg = c.fg, bg = c.bg_hard },
		TelescopeBorder = { fg = c.dim3, bg = c.bg_hard },
		TelescopeTitle = { fg = c.lime, bg = c.bg_hard, bold = true },
		TelescopePromptNormal = { fg = c.fg, bg = c.bg_hard },
		TelescopePromptPrefix = { fg = c.lime, bg = c.bg_hard },
		TelescopeResultsNormal = { fg = c.fg, bg = c.bg_hard },
		TelescopeSelection = { fg = c.bg_hard, bg = c.lime, bold = true },
		TelescopeSelectionCaret = { fg = c.bg_hard, bg = c.lime },
		TelescopeMatching = { fg = c.bright_lime, bold = true },

		-- ── nvim-cmp ──────────────────────────────────────────────
		CmpItemAbbr = { fg = c.fg },
		CmpItemAbbrMatch = { fg = c.lime, bold = true },
		CmpItemAbbrMatchFuzzy = { fg = c.bright1, bold = true },
		CmpItemMenu = { fg = c.dim1b, italic = true },
		CmpItemKindFunction = { fg = c.bright1 },
		CmpItemKindKeyword = { fg = c.lime },
		CmpItemKindVariable = { fg = c.fg },
		CmpItemKindText = { fg = c.dim2b },

		-- ── Indent guides ─────────────────────────────────────────
		IblIndent = { fg = c.dim1 },
		IblScope = { fg = c.dim3 },

		-- ── Git signs ─────────────────────────────────────────────
		GitSignsAdd = { fg = c.dim3b },
		GitSignsChange = { fg = c.bright1 },
		GitSignsDelete = { fg = c.dim3 },

		-- ── Mini statusline (modos) ───────────────────────────────
		MiniStatuslineModeNormal = { fg = c.bg_hard, bg = c.fg, bold = true },
		MiniStatuslineModeInsert = { fg = c.bg_hard, bg = c.lime, bold = true },
		MiniStatuslineModeVisual = { fg = c.bg_hard, bg = c.dim3b, bold = true },
		MiniStatuslineModeCommand = { fg = c.bg_hard, bg = c.bright1, bold = true },
		MiniStatuslineModeReplace = { fg = c.bg_hard, bg = c.bright_lime, bold = true },
	})
end

-- ── Lualine theme ──────────────────────────────────────────────
local function lualine_theme()
	local bg = "#0D2A1A"
	return {
		normal = {
			a = { fg = "#0D2A1A", bg = "#88A827", gui = "bold" },
			b = { fg = "#88A827", bg = "#0D2A1A" },
			c = { fg = "#88A827", bg = "#0D2A1A" },
		},
		insert = {
			a = { fg = "#0D2A1A", bg = "#B8D432", gui = "bold" },
			b = { fg = "#B8D432", bg = "#0D2A1A" },
			c = { fg = "#B8D432", bg = "#0D2A1A" },
		},
		visual = {
			a = { fg = "#0D2A1A", bg = "#78A020", gui = "bold" },
			b = { fg = "#78A020", bg = "#0D2A1A" },
			c = { fg = "#78A020", bg = "#0D2A1A" },
		},
		replace = {
			a = { fg = "#0D2A1A", bg = "#D4F060", gui = "bold" },
			b = { fg = "#D4F060", bg = "#0D2A1A" },
			c = { fg = "#D4F060", bg = "#0D2A1A" },
		},
		command = {
			a = { fg = "#0D2A1A", bg = "#9CB827", gui = "bold" },
			b = { fg = "#9CB827", bg = "#0D2A1A" },
			c = { fg = "#9CB827", bg = "#0D2A1A" },
		},
		inactive = {
			a = { fg = "#468050", bg = "#0D2A1A" },
			b = { fg = "#468050", bg = "#0D2A1A" },
			c = { fg = "#468050", bg = "#0D2A1A" },
		},
	}
end

-- ── Plugin specs para LazyVim ───────────────────────────────────
-- colorscheme como función: LazyVim la llama directamente,
-- sin buscar ningún archivo colors/*.lua en el runtimepath.
return {
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = function()
				apply()
			end,
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = { theme = lualine_theme() },
		},
	},
}
