local Chao = require("testeJogo.chao")
local ChaoGelo = Chao:extend()

function ChaoGelo:new(x, y)
    ChaoGelo.super.new(self, x, y, "assets/chaoGelo.png")
end

function ChaoGelo:update(dt)
    self.super.update(self)
end

function ChaoGelo:beginContact(b, coll)
    self.super.beginContact(self)
end

return ChaoGelo