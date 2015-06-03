#!/usr/bin/env lua5.1

-- Copyright mrDoctorWho <mrdoctorwho@gmail.com>
-- Published under the MIT license

package.path = package.path..";../src/?.lua"

local captcha = require 'captcha'

local filename = "captcha2.jpg"

-- Create the captcha object
local cap = captcha.new()
-- Set font (required)
cap:font("./Vera.ttf")
-- Scribble the captcha randomly
cap:scribble()
-- Optional call, allows you to get the captcha text instead of writing the image to a file
cap:generate()
-- Write the generated captcha to file named out1.jpg with quality percentage 70
-- If generate() wasn't called, captcha will be generated automatically
-- Firt param is the filename, second is the image quality percentage
cap:write(filename, 70)

print("Captcha text " .. cap:getStr() .. "\n")
io.write("Captcha data ----\n" .. cap:jpegStr(70) .. "\n----\n")
print("Captcha has been written to "..filename .. "\n")
