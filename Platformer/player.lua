playerStartX = 360
playerStartY = 100

player = world:newRectangleCollider(playerStartX, playerStartY, 40, 100, {collision_class="Player"})
player:setFixedRotation(true)
player.speed = 240
player.animation = animations.idle
player.isMoving = false
player.direction = 1
player.isGrounded = true

function playerUpdate(dt)

    player.isGrounded = checkForPayerColliders()
    player.isMoving = false

    local px, _ = player:getPosition()

    if love.keyboard.isDown("right") then
        player:setX(px + player.speed * dt)
        player.isMoving = true
        player.direction = 1
    end

    if love.keyboard.isDown("left") then
        player:setX(px - player.speed * dt)
        player.isMoving = true
        player.direction = -1
    end

    if player:enter("Danger") then
        player:setPosition(playerStartX, playerStartY)
    end

    player.animation = setPlayerAnimation()
    player.animation:update(dt)
end

function drawPlayer()
    if player.body then
        local px, py = player:getPosition()
        player.animation:draw(sprites.playerSheet, px, py, nil, 0.25 * player.direction, 0.25, 130, 300)
    end
end

function setPlayerAnimation()
    if player.isGrounded then
        if player.isMoving then
            return animations.run
        else
            return animations.idle
        end
    else
        return animations.jump
    end
end

function checkForPayerColliders()
    local colliders = world:queryRectangleArea(player:getX()-20, player:getY()+50, 40, 2, {"Platform"})
    if # colliders > 0 then
        return true
    else
        return false
    end
end