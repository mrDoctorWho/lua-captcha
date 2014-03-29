module("captcha", package.seeall)

-- copyright startx <startx@plentyfact.org>
-- under the MIT license

local gd = require 'gd'

local mt = { __index = {} }


function new()
  local cap = {}
  local f = setmetatable({ cap = cap }, mt)

return f
end


local function urandom()
local seed = 1
      local devurandom = io.open("/dev/urandom", "r")
      local urandom = devurandom:read(32)
      devurandom: close()

  for i=1,string.len(urandom) do
    s = string.byte(urandom,i)
    seed = seed + s
  end

return seed
end


local function random_char(length)
  local set, char, uid
  local set = [[1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ]]
  local captcha_t = {}

  math.randomseed(urandom())
  
  for c=1,length do
     i = math.random(1,string.len(set))
     table.insert(captcha_t, string.sub(set,i,i))
  end

return captcha_t
end


local function random_angle()
  math.randomseed(urandom())

return math.random(-20, 40) 
end


local function scribble(w,h)
math.randomseed(urandom())
   local x1 = math.random(5, w - 5)
   local x2 = math.random(5, w - 5)

return x1, x2
end


function mt.__index:string(s)
  self.cap.string = s
end

function mt.__index:scribble(n)
  self.cap.scribble = n or 20
end

function mt.__index:length(l)
  self.cap.length = l
end


function mt.__index:bgcolor(r,g,b)
  self.cap.bgcolor = { r = r , g = g , b = b}
end

function mt.__index:fgcolor(r,g,b)
  self.cap.fgcolor = { r = r , g = g , b = b}
end

function mt.__index:line(line)
  self.cap.line = line
end


function mt.__index:font(font)
  self.cap.font = font 
end


function mt.__index:write(outfile)
local captcha_t = {}

if not self.cap.string then
   if not self.cap.length then
      self.cap.length = 6
   end
   captcha_t = random_char(self.cap.length)
else
   for i=1, #self.cap.string do
      table.insert(captcha_t, string.sub(self.cap.string, i, i))
   end
end


local im = gd.createTrueColor(#captcha_t * 40, 45)
    local black = im:colorAllocate(0, 0, 0)
    local white = im:colorAllocate(255, 255, 255)
    local bgcolor
        if not self.cap.bgcolor then
           bgcolor = white      
        else
           bgcolor = im:colorAllocate(self.cap.bgcolor.r , self.cap.bgcolor.g, self.cap.bgcolor.b )
        end

    local fgcolor
        if not self.cap.fgcolor then
            fgcolor = black
        else
            fgcolor = im:colorAllocate(self.cap.fgcolor.r , self.cap.fgcolor.g, self.cap.fgcolor.b )
        end

    local font = self.cap.font or "./Vera.ttf"

im:filledRectangle(0, 0, #captcha_t * 40, 45, bgcolor)
  
local offset_left = 10

    for i=1, #captcha_t do
        local angle = random_angle()
        local llx, lly, lrx, lry, urx, ury, ulx, uly = im:stringFT(fgcolor, font, 25, math.rad(angle), offset_left, 35, captcha_t[i])
        im:polygon({ {llx, lly}, {lrx, lry}, {urx, ury}, {ulx, uly} }, bgcolor)
        offset_left = offset_left + 40
    end

    if self.cap.line then
        im:line(10, 10, ( #captcha_t * 40 ) - 10  , 40, fgcolor)
        im:line(11, 11, ( #captcha_t * 40 ) - 11  , 41, fgcolor)
        im:line(12, 12, ( #captcha_t * 40 ) - 12  , 42, fgcolor)
    end


    if self.cap.scribble then
        for i=1,self.cap.scribble do
           local x1,x2 = scribble( #captcha_t * 40 , 45 )
           im:line(x1, 5, x2  , 40, fgcolor)
        end
    end

im:png(outfile)

return table.concat(captcha_t)
end


