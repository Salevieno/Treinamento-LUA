require("core.auxiliary.utils")
local Entity = require("core.entity")

-- Funções callback do mundo

-- when two fixtures start overlapping (two objects collide).
function BeginContact(a, b, coll)
    local entityA, entityB = GetEntityFromFixtures(a, b)
    -- Checar se a entidade tem algum comportamento antes de chamar
	if type(entityA.beginContact) == "function" then
        entityA:beginContact(entityA, coll)
    end
	if type(entityB.beginContact) == "function" then
        entityB:beginContact(entityB, coll)
    end
end

-- when two fixtures stop overlapping (two objects disconnect).
function EndContact(a, b, coll)
    local entityA, entityB = GetEntityFromFixtures(a, b)
	if type(entityA.endContact) == "function" then
        entityA:endContact(entityA, coll)
    end
	if type(entityB.endContact) == "function" then
        entityB:endContact(entityB, coll)
    end
end

-- just before a frame is resolved for a current collision
function PreSolve(a, b, coll)
    local entityA, entityB = GetEntityFromFixtures(a, b)
	if type(entityA.preSolve) == "function" then
        entityA:preSolve(entityA, coll)
    end
	if type(entityB.preSolve) == "function" then
        entityB:preSolve(entityB, coll)
    end
end

-- just after a frame is resolved for a current collision.
function PostSolve(a, b, coll, normalimpulse, tangentimpulse)
    local entityA, entityB = GetEntityFromFixtures(a, b)
	if type(entityA.postSolve) == "function" then
        entityA:postSolve(entityA, coll, normalimpulse, tangentimpulse)
    end
	if type(entityB.postSolve) == "function" then
        entityB:postSolve(entityB, coll, normalimpulse, tangentimpulse)
    end
end

function GetWorldEntities()
    local worldEntities = {}
    local worldBodies = World:getBodies()
    for i = 1, #worldBodies do
        local possibleEntity = worldBodies[i]:getFixtures()[1]:getUserData()
        if possibleEntity ~= nil and possibleEntity:is(Entity) then
            table.insert(worldEntities, possibleEntity)
        end
    end
    return worldEntities
end

function UpdateWorldEntities(dt)
    World:update(dt)

    local worldEntities = GetWorldEntities()
    for i=1, #worldEntities do
        worldEntities[i]:update(dt)
    end
end

function DrawWorldEntities()
    local worldEntities = GetWorldEntities()

    for i=1, #worldEntities do
        worldEntities[i]:draw()
    end
end