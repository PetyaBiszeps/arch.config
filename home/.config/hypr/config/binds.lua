local mod = "SUPER"

hl.bind(mod .. " + Return", hl.dsp.exec_cmd("ghostty"))
hl.bind(mod .. " + E", hl.dsp.exec_cmd("nautilus"))
hl.bind(mod .. " + B", hl.dsp.exec_cmd("chromium"))
hl.bind(mod .. " + Q", hl.dsp.window.close())
