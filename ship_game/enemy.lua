local Entity = require("core.entity")
local Enemy = Entity:extend()
local BodyType = require("core.enums.body_types")
local ShapeType = require("core.enums.shape_types")

function Enemy:new(positionX, positionY, speed)
    Enemy.super.new(self, positionX, positionY, "assets/snake.png", World, ShapeType.CIRCLE, BodyType.DYNAMIC)
    self.speed = speed
end

function Enemy:update()
    if self:hitBoundaries() then
        self.speed = -self.speed
    end

    local velocityX, velocityY = self.speed, 0
    self.physics:setVelocity(velocityX, velocityY)
end

function Enemy:hitBoundaries()
    local minX, maxX = self.physics.boundaries.x.min, self.physics.boundaries.x.max
    local currentX, currentY = self.physics:getPositionRounded()

    return currentX == minX or currentX == maxX
end

function Enemy:beginContact()
    self.speed = self.speed*1.1
end

return Enemy