local one_monokai = {
	fg = "#abb2bf",
	--bg = "#282c34",
	bg = "#2d333e",
	green = "#98c379",
	yellow = "#e5c07b",
	purple = "#c678dd",
	orange = "#da7b44",
	peanut = "#f6d5a4",
	red = "#e06c75",
	aqua = "#61afef",
	darkblue = "#282c34",
	dark_red = "#f75f5f",
}

local vi_mode_colors = {
	NORMAL = "green",
	OP = "green",
	INSERT = "yellow",
	VISUAL = "purple",
	LINES = "orange",
	BLOCK = "dark_red",
	REPLACE = "red",
	COMMAND = "aqua",
}

local c = {
	vim_mode = {
		provider = {
			name = "vi_mode",
			opts = {
				show_mode_name = true,
				-- padding = "center", -- Uncomment for extra padding.
			},
		},
		hl = function()
			return {
				fg = "darkblue",
				bg = require("feline.providers.vi_mode").get_mode_color(),
				style = "bold",
				name = "NeovimModeHLColor",
			}
		end,
		left_sep = "",
		right_sep = "",
	},
	gitBranch = {
		provider = "git_branch",
		hl = {
			fg = "peanut",
			bg = "darkblue",
			style = "bold",
		},
		left_sep = "block",
		right_sep = "block",
	},
	gitDiffAdded = {
		provider = "git_diff_added",
		hl = {
			fg = "green",
			bg = "darkblue",
		},
		left_sep = "block",
		right_sep = "block",
	},
	gitDiffRemoved = {
		provider = "git_diff_removed",
		hl = {
			fg = "red",
			bg = "darkblue",
		},
		left_sep = "block",
		right_sep = "block",
	},
	gitDiffChanged = {
		provider = "git_diff_changed",
		hl = {
			fg = "fg",
			bg = "darkblue",
		},
		left_sep = "block",
		right_sep = "right_filled",
	},
	separator = {
		provider = " ",
		hl = {
			--	fg = "darkblue",
		},
	},
	fileinfo = {
		provider = {
			name = "file_info",
			opts = {
				type = "",
			},
		},
		hl = {
			style = "bold",
			bg = "darkblue",
		},
		left_sep = "",
		right_sep = "",
	},
	diagnostic_errors = {
		provider = "diagnostic_errors",
		hl = {
			fg = "red",
		},
		left_sep = "block",
		--right_sep = "block",
	},
	diagnostic_warnings = {
		provider = "diagnostic_warnings",
		hl = {
			fg = "orange",
		},
		--left_sep = "block",
		--right_sep = "block",
	},
	diagnostic_hints = {
		provider = "diagnostic_hints",
		hl = {
			fg = "#7781da",
		},
	},
	diagnostic_info = {
		provider = "diagnostic_info",
		hl = {
			--fg = "darkblue",
			fg = "aqua",
		},
		--left_sep = "block",
		right_sep = "block",
	},
	lsp_client_names = {
		provider = "lsp_client_names",
		hl = {
			fg = "darkblue",
			bg = "aqua",
			style = "bold",
		},
		left_sep = "",
		right_sep = "",
	},
	file_type = {
		provider = {
			name = "file_type",
			opts = {
				filetype_icon = true,
				case = "titlecase",
			},
		},
		hl = {
			--fg = "darkblue",
			--			bg = "darkblue",
			style = "bold",
		},
		left_sep = "block",
		right_sep = "block",
	},
	file_encoding = {
		provider = "file_encoding",
		hl = {
			fg = "darkblue",
			bg = "purple",
			style = "bold",
		},
		left_sep = "",
		right_sep = "block",
	},
	position = {
		provider = "position",
		hl = {
			fg = "darkblue",
			bg = "dark_red",
			style = "bold",
		},
		left_sep = "",
		right_sep = "block",
	},
	line_percentage = {
		provider = "line_percentage",
		hl = {
			fg = "darkblue",
			bg = "dark_red",
			style = "bold",
		},
		left_sep = "",
		right_sep = "block",
	},
	scroll_bar = {
		provider = "scroll_bar",
		hl = {
			fg = "darkblue",
			bg = "dark_red",
			style = "bold",
		},
		right_sep = "",
	},
}

local left = {
	c.vim_mode,
	c.gitBranch,
	c.gitDiffAdded,
	c.gitDiffRemoved,
	c.gitDiffChanged,
	c.separator,
}

local middle = {
	c.fileinfo,
	c.diagnostic_errors,
	c.diagnostic_warnings,
	c.diagnostic_info,
	c.diagnostic_hints,
}

local right = {
	c.lsp_client_names,
	c.separator,
	--	c.file_type,
	--	c.file_encoding,
	--c.position,
	c.line_percentage,
	c.scroll_bar,
}

local components = {
	active = {
		left,
		middle,
		right,
	},
	inactive = {
		left,
		middle,
		right,
	},
}

local status, feline = pcall(require, "feline")
if not status then
	return
end

feline.setup({
	components = components,
	theme = one_monokai,
	vi_mode_colors = vi_mode_colors,
})