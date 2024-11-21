local Chao = require("testeJogo.chao")
local ChaoLava = Chao:extend()

function ChaoLava:new(x, y)
    ChaoLava.super.new(self, x, y, "assets/chaoLava.png")
end

function ChaoLava:update(dt)
    self.super.update(self)
end

function ChaoLava:beginContact(b, coll)
    self.super.beginContact(self)
end

return ChaoLava