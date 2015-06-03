lua-captcha
======

**Introduction**
<hr/>
*Lua-captcha* is a simple lua library that allows you to generate captcha images. It uses [lua-gd](https://github.com/ittner/lua-gd/) library to create images.

Contains several fixes and some new features such as easy way to get the captcha image data.

*Lua-captcha* is based on the *[lua-captcha](http://projects.plentyfact.org/projects/lua-captcha/wiki)* project.

**Dependencies**
<hr/>
* [libgd](https://github.com/libgd/libgd) — GD Graphics library
* [lua-gd](https://github.com/ittner/lua-gd/) — Lua bindings to libgd

**Installation**
<hr/>
All you need is to run:

```bash
make install
```
And have fun.

**Usage**
<hr/>
Usage is quite simple.
```lua
package.path = package.path..";../src/?.lua"
local captcha = require 'captcha'
local filename = "captcha1.jpg"
-- Create the captcha object
local cap = captcha.new()
-- Set font (required)
cap:font("./Vera.ttf")
cap:write(filename, 70)
print("Captcha text " .. cap:getStr() .. "\n")
```
The code above would write an image with name *captcha1.jpg*.
Look the *examples* folder for more examples.

**Copyright**

© 2011 startx <startx@plentyfact.org>

© 2014-2015 mrDoctorWho <mrdoctorwho@gmail.com>

**License**
<hr/>
The [MIT](https://github.com/mrDoctorWho/lua-captcha/blob/master/LICENSE) License.
