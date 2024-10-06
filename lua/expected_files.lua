local lfs = require("lfs")
local log = require("output")

-- Function to check if the file extension is in the expected list
--- @param file string
--- @param expected_extensions table
local function is_expected_extension(file, expected_extensions)
	-- Extract the file extension
	local ext = file:match("^.+(%..+)$")

	-- If the file has an extension, check if it's in the expected list
	if ext then
		for _, valid_ext in ipairs(expected_extensions) do
			if ext == valid_ext then
				return true -- Extension matches one in the list
			end
		end
	end
	return false -- Extension not in the list or no extension found
end

-- Function to check for files with extensions not in the expected list
--- @param directory string
--- @param expected_extensions table
local function check_other_files(directory, expected_extensions)
	local fileCount = 0
	-- Iterate over files in the specified directory
	for file in lfs.dir(directory) do
		-- Skip the current directory (.) and parent directory (..)
		if file ~= "." and file ~= ".." and file ~= ".DS_Store" and file ~= ".keep" then
			fileCount = fileCount + 1
			-- Check if the file has an unexpected extension
			if is_expected_extension(file, expected_extensions) then
				log.println("File: " .. file)
			else
				log.println("Unexpected file: " .. file)
			end
		end
	end

	return fileCount
end

log.println("Total elements in input directory: " .. check_other_files(InputDir, { ".md", ".java" }))
