anim8 = require "libraries/anim8/anim8"
sprites = {}
sprites.playerSheet = love.graphics.newImage('sprites/playerSheet.png')

local grid = anim8.newGrid(614, 564, sprites.playerSheet:getWidth(), sprites.playerSheet:getHeight())

animations = {}
animations.idle = anim8.newAnimation(grid("1-15", 1), 0.05)
animations.jump = anim8.newAnimation(grid("1-7", 2), 0.05)
animations.run = anim8.newAnimation(grid("1-15", 3), 0.05)