----------------------
---- WINDOW RULES ----
----------------------
-- lua/rules.lua

local suppressMaximizeRule = hl.window_rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

hl.window_rule({
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_focus = true,
})

hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },
	move = "20 monitor_h-120",
	float = true,
})

hl.window_rule({
	name = "kitty-resize-fix",
	match = { class = "kitty" },
	no_initial_focus = false,
})

hl.layer_rule({
	name = "waybar-blur",
	match = {
		namespace = "waybar",
	},
	blur = true,
	ignore_alpha = 0.2,
})

hl.window_rule({
	name = "cava-popup",
	match = {
		class = "^cava$",
	},
	float = true,
	size = "640 250",
	move = "940 655",
})

hl.window_rule({
	name = "sized-terminal",
	match = {
		class = "^my-terminal$",
	},
	float = true,
	size = "870 475",
	move = "20 438",
})

hl.window_rule({
	name = "sonora-custom",
	match = {
		class = "^sonora$",
	},
	float = true,
	size = "730 350",
	move = "910 140",
})
