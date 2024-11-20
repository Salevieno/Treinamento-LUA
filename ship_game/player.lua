local Entity = require("core.entity")
local Player = Entity:extend()
local BodyType = require("core.enums.body_types")
local ShapeType = require("core.enums.shape_types")
local Bullet = require("ship_game.bullet")

function Player:new(x, y, speed)
    Player.super.new(self, x, y, "assets/panda.png", World, ShapeType.CIRCLE, BodyType.DYNAMIC)
    self.speed = speed
    self.shootingCooldown = 0.5
    self.cooldownTimer = 0
end

function Player:update(timeSinceLastFrame)
    self.super.update(self)
    self:checkForMovement()
    self:CheckForShooting(timeSinceLastFrame)
end

function Player:CheckForShooting(timeSinceLastFrame)
    if self.cooldownTimer > 0 then
        self.cooldownTimer = self.cooldownTimer - timeSinceLastFrame
    elseif love.keyboard.isDown("space") then
        local playerX, playerY = self.physics:getPositionRounded()
        local playerWidth, playerHeight = self.physics:getSize()
        local playerBottomX, playerBottomY = playerX, math.ceil(playerY + playerHeight/2)
        local bulletHeight = 34 -- tá no arquivo de asset da bullet, não sei uma forma simples de não deixar hardcoded
        Bullet(playerBottomX, playerBottomY+bulletHeight, 0, 300)
        self.cooldownTimer = self.shootingCooldown
    end
end

function Player:checkForMovement()
    local velocityX, velocityY = 0, 0

    if love.keyboard.isDown("right") then
        velocityX = self.speed
    end
    if love.keyboard.isDown("left") then
        velocityX = - self.speed
    end
    if love.keyboard.isDown("up") then
        velocityY = - self.speed
    end
    if love.keyboard.isDown("down") then
        velocityY = self.speed
    end

    self.physics:setVelocity(velocityX, velocityY)
end

return Player