local Player = require("ship_game.player")
local Enemy = require("ship_game.enemy")
require("core.auxiliary.world_functions")
require("core.auxiliary.utils")
require("core.auxiliary.debug")

if arg[2] == "debug" then
    require("lldebugger").start()
    DEBUG_MODE = true
end

-- love.load -> love.update -> love.draw -> love.update -> love.draw -> love.update (...)

function love.load()
    World = love.physics.newWorld(0, 0, true)
    World:setCallbacks(BeginContact, EndContact, PreSolve, PostSolve)
    PlayerOne = Player(0, 100, 100)
    novaVar = 1
    EnemySnake = Enemy(500, 500, 100)
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