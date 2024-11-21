local Entity = require('core.entity')
local Jogador = Entity:extend()
local ShapeTypes = require("core.enums.shape_types")
local BodyTypes = require("core.enums.body_types")

function Jogador:new(x, y)
    Jogador.super.new(self, x, y, "assets/panda.png", World, ShapeTypes.CIRCLE, BodyTypes.DYNAMIC)
end

function Jogador:update()
    if love.keyboard.isDown("left") then
        self.physics:move(-1, 0)
    end
end

return Jogador

