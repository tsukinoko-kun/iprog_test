InputDir = "/app/input"
OutputDir = "/app/output"

require("expected_files")
local log = require("output")
local run = require("run")

log.println("compiling java files")
log.println(run("javac -d " .. OutputDir .. " " .. InputDir .. "/*.java"))

log.println("running java files")
log.println(run("java --class-path " .. OutputDir .. " Program"))

log.close()
