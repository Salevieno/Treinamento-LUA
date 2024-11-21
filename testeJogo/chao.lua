local Entity = require('core.entity')
local Chao = Entity:extend()
local ShapeTypes = require("core.enums.shape_types")
local BodyTypes = require("core.enums.body_types")

function Chao:new(x, y, imagem)
    Chao.super.new(self, x, y, imagem, World, ShapeTypes.CIRCLE, BodyTypes.STATIC)
end

function Chao:update(dt)
    self.super.update(self)
end

function Chao:beginContact(b, coll)
    self.toBeDestroyed= true
end

return Chao