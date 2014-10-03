package.path = package.path..";../src/?.lua"

require 'captcha'

--- examples for lua-captcha

---- simple example
mycaptcha = captcha.new() -- create the captcha object
mycaptcha:font("./Vera.ttf") -- set font
cap = mycaptcha:write("out1.jpg", 70) -- write the captcha to file named out1.jpg with quality percentage 70
print(cap)


---- scribbled background linesq
mycaptcha = captcha.new()
mycaptcha:font("./Vera.ttf")
mycaptcha:scribble() -- scribble the captcha randomly
cap = mycaptcha:write("out2.jpg", 70)
print(cap)



---- with words and colors
mycaptcha = captcha.new() 
mycaptcha:font("./Vera.ttf")
mycaptcha:string("i love lua") -- add the text!
mycaptcha:bgcolor(255, 201, 51) -- colorize background!
mycaptcha:fgcolor(255, 102, 51) -- and foreground!
mycaptcha:line(true)
cap = mycaptcha:write("out3.jpg", 70)
print(cap)

