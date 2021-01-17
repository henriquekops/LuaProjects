anim8 = require "libraries/anim8/anim8"
sprites = {}
sprites.playerSheet = love.graphics.newImage("sprites/playerSheet.png")
sprites.enemySheet = love.graphics.newImage("sprites/enemySheet.png")
sprites.background = love.graphics.newImage("sprites/background.png")

local grid = anim8.newGrid(614, 564, sprites.playerSheet:getWidth(), sprites.playerSheet:getHeight())
local enemyGrid = anim8.newGrid(100, 79, sprites.enemySheet:getWidth(), sprites.enemySheet:getHeight())

animations = {}
animations.idle = anim8.newAnimation(grid("1-15", 1), 0.05)
animations.jump = anim8.newAnimation(grid("1-7", 2), 0.05)
animations.run = anim8.newAnimation(grid("1-15", 3), 0.05)
animations.enemy = anim8.newAnimation(enemyGrid("1-2", 1), 0.03)