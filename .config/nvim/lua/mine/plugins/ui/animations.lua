return {
	"sphamba/smear-cursor.nvim",
	opts = {
		-- Smear cursor when switching buffers or windows
		smear_between_buffers = true,

		-- Smear cursor when moving across lines
		smear_between_neighbor_lines = true,

		-- Smooth spring physics config (tweak to your taste)
		stiffness = 1,
		trailing_stiffness = 2,
		damping = 0.95,
		hide_target_hack = false,
	},
}
