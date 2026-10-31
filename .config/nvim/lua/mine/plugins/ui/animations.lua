return {
	"sphamba/smear-cursor.nvim",
	event = "VeryLazy",
	opts = {
		-- The color of the smear tail.
		-- By leaving this blank, it naturally blends with your theme highlights!
		cursor_color = nil,

		-- Stiffness of the spring animation (higher = faster, lower = lazier trailing)
		stiffness = 0.6,

		-- Slowdown factor of the spring animation
		trailing_stiffness = 0.3,

		-- Minimum distance to trigger the smear animation
		distance_stop_animating = 0.1,

		-- Hide the smear cursor when switching to specific modes or buffers
		hide_target_hack = false,
	},
}
