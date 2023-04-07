local wezterm = require 'wezterm'

return {
  enable_tab_bar = false,
  send_composed_key_when_left_alt_is_pressed = true,
  color_scheme = 'Dracula',
  color_schemes = {
    ['Dracula'] = {
      background = '#1e1f2d',
    },
  },
  set_environment_variables = {
    COLORTERM = "truecolor",
  },
  keys = {
    -- in "phys:7" means "the key in the same physical position as 7 in an ANSI standard US keyboard"
    { key = "phys:7", mods = "ALT", action = "DisableDefaultAssignment" },
    { key = "phys:8", mods = "ALT", action = "DisableDefaultAssignment" },
    { key = "phys:9", mods = "ALT", action = "DisableDefaultAssignment" },
  },
  font = wezterm.font {
    family = 'JetBrains Mono',
    harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
  }
}
