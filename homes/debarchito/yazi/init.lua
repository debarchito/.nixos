require("full-border"):setup({
	type = ui.Border.ROUNDED,
})

require("no-status"):setup()

local theme = require("yatline-catppuccin"):setup("mocha")
require("yatline"):setup({
	theme = theme,
	show_background = false,
	header_line = {
		left = {
			section_a = {
				{ type = "line", custom = false, name = "tabs", params = { "left" } },
			},
			section_b = {},
			section_c = {},
		},
		right = {
			section_a = {},
			section_b = {},
			section_c = {},
		},
	},
})
