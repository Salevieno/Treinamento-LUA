require("core.auxiliary.world_functions")
require("core.auxiliary.utils")
require("core.auxiliary.debug")
local Chao = require("testeJogo.chao")
local ChaoLava = require("testeJogo.chaoLava")
local ChaoGelo = require("testeJogo.chaoGelo")
local Jogador = require("testeJogo.jogador")


if arg[2] == "debug" then
    require("lldebugger").start()
    DEBUG_MODE = true
end
 
-- love.load -> love.update -> love.draw -> love.update -> love.draw -> love.update (...)

function love.load()
    World = love.physics.newWorld(0, 100, true)
    World:setCallbacks(BeginContact, EndContact, PreSolve, PostSolve)
    chao = Chao(400, 200, "assets/chao.png")
    chaoLava = ChaoLava(300, 250)
    chaoGelo1 = ChaoGelo(200, 300)
    chaoGelo2 = ChaoGelo(100, 350)
    jogador = Jogador(400, 50)
end

function love.update(dt)
    UpdateWorldEntities(dt)
end

function love.draw()
    DrawWorldEntities()
    if DEBUG_MODE then
        DrawWorldEntityCountTopLeft()
    end
end

local love_errorhandler = love.errorhandler

function love.errorhandler(msg)
    if lldebugger then
        error(msg, 2)
    else
        return love_errorhandler(msg)
    end
end