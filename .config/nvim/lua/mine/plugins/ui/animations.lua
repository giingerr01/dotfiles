return {
	"sphamba/smear-cursor.nvim",
	opts = {
		-- Smear cursor when switching buffers or windows
		smear_between_buffers = true,

		-- Smear cursor when moving across lines
		smear_between_neighbor_lines = true,

		-- Smooth spring physics config (tweak to your taste)
		stiffness = 0.5,
		trailing_stiffness = 0.3,
		damping = 0.85,
		hide_target_hack = false,
	},
}
