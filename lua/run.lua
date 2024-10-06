--- @param command string
--- @return string
local function run(command)
	local handle = io.popen(command .. " 2>&1")
	if not handle then
		return nil
	end
	local result = handle:read("*a")
	handle:close()
	return result
end

return run
