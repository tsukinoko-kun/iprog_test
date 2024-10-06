-- create or truncate the file
local file = io.open("/app/output/log.txt", "w")
if file then
	file:write("")
	file:close()
end

-- open the file in append mode
file = io.open("/app/output/log.txt", "a")

--- @param s string
local function println(s)
	if file then
		file:write(s .. "\n")
	end
end

--- @param fmt string
--- @param ... any
local function printf(fmt, ...)
	if file then
		file:write(string.format(fmt, ...))
	end
end

local function close()
	if file then
		file:close()
	end
end

return {
	println = println,
	printf = printf,
	close = close,
}
