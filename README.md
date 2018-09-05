lua-captcha
======

**What**

Lua-captcha is a simple lua library that allows you to generate captcha images. It uses [lua-gd](https://github.com/ittner/lua-gd) library to create images.

This repository contains several fixes and a few new features, such as an easy way to get the generated image data.

Note: *Lua-captcha* is based on the *[lua-captcha](http://projects.plentyfact.org/projects/lua-captcha/wiki)* project by startx.

**Dependencies**
* [libgd](https://github.com/libgd/libgd) — GD Graphics library
* [lua-gd](https://github.com/ittner/lua-gd/) — Lua bindings to libgd

**Installation**
All you need is to run:

```bash
make install
```
And have fun!

**Usage**

Usage is quite simple.

The following code is used to write the generated captcha to a file named "captcha1.jpg":

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
Look the *examples* folder for more examples.

**Copyright**

© 2011 startx <startx@plentyfact.org>

© 2014-2015 mrDoctorWho <mrdoctorwho@gmail.com>

**License**

The [MIT](https://github.com/mrDoctorWho/lua-captcha/blob/master/LICENSE) License.
