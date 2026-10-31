local mod = "SUPER"

-- Applications
hl.bind(mod .. " + Return", hl.dsp.exec_cmd("ghostty"))
hl.bind(mod .. " + E", hl.dsp.exec_cmd("nautilus"))
hl.bind(mod .. " + B", hl.dsp.exec_cmd("helium-browser"))
hl.bind(mod .. " + R", hl.dsp.exec_cmd("rofi -show drun"))

-- Hyprland
hl.bind(mod .. " + Q", hl.dsp.window.close())

-- Misc
hl.bind("Print", hl.dsp.exec_cmd([[sh -c 'area=$(slurp) && grim -g "$area" - | wl-copy -t image/png']]))
hl.bind("mouse:272", hl.dsp.exec_cmd("~/.config/rofi/scripts/close-on-click.sh"), {
  non_consuming = true
})
