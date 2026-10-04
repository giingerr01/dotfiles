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
		gaps_in = 5,
		gaps_out = 6,
		border_size = 2,
		col = {
			active_border = {
				colors = {
					"rgba(" .. colors.color4:gsub("#", "") .. "ee)",
					"rgba(" .. colors.color5:gsub("#", "") .. "ee)",
				},
				angle = 45,
			},
			inactive_border = "rgba(" .. colors.color8:gsub("#", "") .. "ee)",
		},
		resize_on_border = false,
		allow_tearing = true,
		layout = "dwindle",
	},

	decoration = {
		rounding = 8,
		rounding_power = 5,
		active_opacity = 1.0,
		inactive_opacity = 1.0,

		shadow = {
			enabled = true,
			range = 20,
			render_power = 3,
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

--------------------
---- ANIMATIONS ----
--------------------

-- Refined curves
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear", { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

-- Upgraded spring physics (tighter, snappier elasticity)
hl.curve("easy", { type = "spring", mass = 1, stiffness = 160, dampening = 20 })

-- Animations
hl.animation({ leaf = "global", enabled = true, speed = 4, bezier = "easeOutQuint" })
hl.animation({ leaf = "border", enabled = true, speed = 5, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 3.5, spring = "easy" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 3.8, spring = "easy", style = "popin 85%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 2.5, bezier = "easeOutQuint", style = "popin 85%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 2.5, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 2.0, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.0, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.5, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 3.5, bezier = "easeOutQuint", style = "popin 80%" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 2.5, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 2.0, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.8, bezier = "almostLinear" })

-- Workspace transitions (Switching to 'slidefade' for a much cleaner look than simple fade)
hl.animation({ leaf = "workspaces", enabled = true, speed = 3.2, bezier = "easeOutQuint", style = "slidefade 20%" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 3.2, bezier = "easeOutQuint", style = "slidefade 20%" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 2.8, bezier = "easeOutQuint", style = "slidefade 20%" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 6, bezier = "quick" })
