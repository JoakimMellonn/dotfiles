local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

local time = os.date("%H:%M")
local v = vim.version()
local version = " v" .. v.major .. "." .. v.minor .. "." .. v.patch


dashboard.section.header.val = {
	[[                                                                       ]],
	[[                                                                       ]],
	[[                                                                       ]],
	[[                                                                       ]],
	[[                                                                       ]],
	[[                                                                       ]],
	[[                                                                       ]],
	[[                                                                       ]],
	[[                                                                       ]],
	[[                                                                       ]],
	[[                                                                       ]],
	[[                                                                       ]],
	[[  ██████   █████                   █████   █████  ███                  ]],
	[[ ░░██████ ░░███                   ░░███   ░░███  ░░░                   ]],
	[[  ░███░███ ░███   ██████   ██████  ░███    ░███  ████  █████████████   ]],
	[[  ░███░░███░███  ███░░███ ███░░███ ░███    ░███ ░░███ ░░███░░███░░███  ]],
	[[  ░███ ░░██████ ░███████ ░███ ░███ ░░███   ███   ░███  ░███ ░███ ░███  ]],
	[[  ░███  ░░█████ ░███░░░  ░███ ░███  ░░░█████░    ░███  ░███ ░███ ░███  ]],
	[[  █████  ░░█████░░██████ ░░██████     ░░███      █████ █████░███ █████ ]],
	[[ ░░░░░    ░░░░░  ░░░░░░   ░░░░░░       ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░  ]],
}

dashboard.section.buttons.val = {
	dashboard.button("SPC s l", "  Last session"),
	dashboard.button("SPC s f", "  Search sessions"),
	dashboard.button("SPC f f", "󰈞  Find file"),
	dashboard.button("SPC f g", "  Live grep"),
	dashboard.button("SPC f r", "  Resume Telescope"),
	dashboard.button("SPC f b", "  Open buffers"),
}

dashboard.section.footer.val = {
  " " .. time .. " ",
  version,
}

alpha.setup(dashboard.opts)
