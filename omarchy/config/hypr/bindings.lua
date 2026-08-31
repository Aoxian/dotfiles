-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Calendar: HEY -> Proton Calendar
hl.unbind("SUPER + SHIFT + C")
o.bind("SUPER + SHIFT + C", "Calendar", { webapp = "https://calendar.proton.me" })

-- Mail: HEY -> Proton Mail
hl.unbind("SUPER + SHIFT + E")
o.bind("SUPER + SHIFT + E", "Email", { webapp = "https://mail.proton.me" })
hl.unbind("SUPER + SHIFT + ALT + E")
o.bind("SUPER + SHIFT + ALT + E", "New email", { webapp = "https://mail.proton.me/u/0/compose" })

-- Google apps: removed, unbind their defaults
hl.unbind("SUPER + SHIFT + CTRL + G")
hl.unbind("SUPER + SHIFT + P")
hl.unbind("SUPER + SHIFT + S")

-- Screenshot: for keyboards without a PRINT key.
o.bind("SUPER + SHIFT + S", "Screenshot", "omarchy-capture-screenshot")

-- X: use a browser tab instead of a dedicated webapp window
hl.unbind("SUPER + SHIFT + X")
hl.unbind("SUPER + SHIFT + ALT + X")

o.bind("SUPER + SHIFT + Z", "Zoom", { launch = "omarchy-webapp-handler-zoom" })

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")
