require("core.auxiliary.world_functions")

function DrawWorldEntityCountTopLeft()
    local worldEntities = GetWorldEntities()
    love.graphics.print("Number of entities: " .. #worldEntities, 10, 10)
end