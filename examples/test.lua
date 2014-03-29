package.path = package.path..";../src/?.lua"

require 'captcha'

--- examples for lua-captcha

---- simple example
mycaptcha = captcha.new()
mycaptcha:font("./Vera.ttf")
cap = mycaptcha:write("out1.png")
print(cap)


---- scribbled background lines
mycaptcha = captcha.new()
mycaptcha:font("./Vera.ttf")
mycaptcha:scribble()
cap = mycaptcha:write("out2.png")
print(cap)



---- with words and colors
mycaptcha = captcha.new()
mycaptcha:font("./Vera.ttf")
mycaptcha:string("i love lua")
mycaptcha:bgcolor(255, 201, 51)
mycaptcha:fgcolor(255, 102, 51)
mycaptcha:line(true)
cap = mycaptcha:write("out3.png")
print(cap)

