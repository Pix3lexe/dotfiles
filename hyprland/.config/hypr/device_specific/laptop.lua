-- Laptop screen
hl.monitor({
	output = "eDP-1",
	mode = "1920x1080@60",
	position = "0x0",
	scale = "1",
})

hl.on("hyprland.start", function()
	hl.exec_cmd("nm-applet")
	hl.exec_cmd("waybar & swaync & hypridle & hyprpaper")
end)

-- Laptop trackpad
hl.device({
	name = "gxtp5140:00-27c6:01e0-1",
	sensitivity = 0,
})

-- Laptop keyboard
hl.device({
	name = "at-translated-set-2-keyboard",
	kb_layout = "de",
})

hl.config({
	input = {
		sensitivity = 0,
	},
})

return {
	monitor_priority = { "eDP-1", "HDMI-A-1" },
}
