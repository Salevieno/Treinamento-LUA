local Entity = require("core.entity")
local Bullet = Entity:extend()
local BodyType = require("core.enums.body_types")
local ShapeType = require("core.enums.shape_types")

function Bullet:new(positionX, positionY, velocityX, velocityY)
    Bullet.super.new(self, positionX, positionY, "assets/bullet.png", World, ShapeType.RECTANGLE, BodyType.DYNAMIC)
    self.physics:setVelocity(velocityX, velocityY)
end

function Bullet:update(timeSinceLastFrame)
    self.super.update(self)
    if not self.toBeDestroyed and self:isOutOfScreen() then -- TODO: 
        self.toBeDestroyed = true
    end
end

function Bullet:beginContact(b, coll)
    self.toBeDestroyed = true
end

return Bullet