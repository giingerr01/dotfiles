-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_THEME", "Bibata-Modern-Ice")
hl.env("XCURSOR_SIZE", "25")
hl.env("HYPRCURSOR_SIZE", "25")
hl.env("HYPRCURSOR_THEME", "Bibata-Modern-Ice")

-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function()
	hl.exec_cmd("nm-applet")
	hl.exec_cmd("waybar")
	hl.exec_cmd("rescrobbled &")
	hl.exec_cmd("foot --server &")
	hl.exec_cmd("playerctld daemon")
	hl.exec_cmd("hyprctl setcursor Bibata-Modern-Ice 20")
	hl.exec_cmd("wl-paste --watch cliphist store")

	hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE")
	hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP XDG_SESSION_TYPE")

	os.execute("awww-daemon &")
end)
