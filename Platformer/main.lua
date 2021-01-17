function love.load()
    --love.window.setMode(1000, 768)

    require("animations")

    wf = require "libraries/windfield/windfield"
    world = wf.newWorld(0, 800, false)
    world:setQueryDebugDrawing(true)

    world:addCollisionClass("Platform")
    world:addCollisionClass("Player")
    world:addCollisionClass("Danger")

    require("player")

    platform = world:newRectangleCollider(250, 400, 300, 100, {collision_class="Platform"})
    platform:setType("static")

    dangerZone = world:newRectangleCollider(0, 550, 800, 50, {collision_class="Danger"})
    dangerZone:setType("static")
end

function love.update(dt)
    world:update(dt)
    playerUpdate(dt)
end

function love.draw()
    world:draw()
    drawPlayer()
end

function love.keypressed(key)
    if key == "up" then
        if player.isGrounded then
            player:applyLinearImpulse(0, -4000)
        end
    end
end
