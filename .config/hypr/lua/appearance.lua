-- imports
-----------------------
local colors = dofile(os.getenv("HOME") .. "/.cache/wal/hyprland.lua")
-----------------------

----MONITORS ----

hl.monitor({
	output = "HDMI-A-1",
	mode = "1920x1080@100",
	position = "0x0",
	scale = "1",
})

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({
	general = {
		gaps_in = 3,
		gaps_out = 5,
		border_size = 0,
		col = {
			active_border = {
				colors = {
					"rgba(" .. colors.color4:gsub("#", "") .. "ee)",
					-- "rgba(" .. colors.color5:gsub("#", "") .. "ee)",
				},
				-- angle = 45,
			},
			inactive_border = "rgba(" .. colors.color8:gsub("#", "") .. "ee)",
		},
		resize_on_border = false,
		allow_tearing = true,
		layout = "dwindle",
	},

	decoration = {
		rounding = 2,
		rounding_power = 3,
		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = true,
			range = 10,
			render_power = 4,
		},

		blur = {
			enabled = false,
			size = 4,
			passes = 3,
			vibrancy = 0.1696,
			ignore_opacity = true,
			xray = true,
			new_optimizations = true,
		},
	},

	animations = {
		enabled = true,
	},

	dwindle = {
		preserve_split = true,
	},

	master = {
		new_status = "master",
	},

	scrolling = {
		fullscreen_on_one_column = true,
	},

	misc = {
		force_default_wallpaper = -1,
		disable_hyprland_logo = false,
	},
})
