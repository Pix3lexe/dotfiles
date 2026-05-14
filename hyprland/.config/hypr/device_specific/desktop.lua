hl.monitor({
	output = "DP-1",
	mode = "2560x1440@240",
	position = "0x0",
	scale = "1",
	vrr = 3,
	bitdepth = 10,
})

hl.monitor({
	output = "DP-3",
	mode = "1920x1080@144",
	position = "2560x0",
	scale = "1",
})

hl.monitor({
	output = "DP-2",
	mode = "1920x1080@60",
	position = "-1920x0",
	scale = "1",
})

hl.on("hyprland.start", function()
	hl.exec_cmd("hyprpm reload")
	hl.exec_cmd("nm-applet & fcitx5 -d")
	hl.exec_cmd("waybar & swaync & hypridle & hyprpaper")
end)

-- Nvidia specific variables
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("GBM_BACKEND", "nvidia-drm")
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("__GL_MaxFramesAllowed", "1")
hl.env("PROTON_ENABLE_NGX_UPDATER", "1")
hl.env("VDPAU_DRIVER", "nvidia")
hl.env("__GL_GSYNC_ALLOWED", "1")

local smw = hl.plugin.split_monitor_workspaces
smw.monitor_priority({ "DP-1", "DP-3", "DP-2" })

hl.config({
	input = {
		sensitivity = -0.5,
	},

	render = {
		cm_auto_hdr = 2,
	},
})
