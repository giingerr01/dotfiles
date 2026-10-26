local M = {}

function M.cowboy()
	local count = 0
	local timer = vim.uv.new_timer()
	local notification_id

	local function reset()
		count = 0
		notification_id = nil
	end

	for _, key in ipairs({ "h", "j", "k", "l", "+", "-" }) do
		-- Keep gj/gk behavior for wrapped lines, like LazyVim's defaults
		local map = (key == "j" or key == "k") and ("g" .. key) or key

		vim.keymap.set({ "n", "x" }, key, function()
			-- Intentional count motion like 10j
			if vim.v.count > 0 then
				reset()
				return key
			end

			count = count + 1

			-- Unlock after 2 seconds of not using the cowboy keys
			timer:stop()
			timer:start(2000, 0, vim.schedule_wrap(reset))

			if count >= 10 then
				if not notification_id then
					notification_id = vim.notify("Hold it Cowboy! 🤠", vim.log.levels.WARN, {
						title = "Warning",
						replace = notification_id,
						keep = function()
							return count >= 10
						end,
					})
				end
				return ""
			end

			return map
		end, { expr = true, silent = true })
	end
end

return M
