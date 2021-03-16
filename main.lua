os.setComputerLabel("Teleport frank")

function goto_pickup()
    print("goto_pickup")

    if state.orientation == 'deposit' then
        turtle.turnRight()
        turtle.turnRight()
        state.orientation = 'pickup'
    end

    while state.locationX > 0 do
        Success,Data = turtle.inspect()
        if Success then
            if Data.name == 'peripheralsplusone:teleporter' then
                peripheral.call("front","teleport")
                turtle.turnRight()
                turtle.turnRight()
            end
        end
        print(state.locationX)
        turtle.forward()
        state.locationX = state.locationX - 1
    end
end

function pickup()
    print("pickup")
    cansuck = true
    while cansuck do
        cansuck = turtle.suck()
    end
end

function goto_deposit()
    print("goto_deposit")

    if state.orientation == 'pickup' then
        turtle.turnRight()
        turtle.turnRight()
        state.orientation = 'deposit'
    end

    chestFound = false

    while not chestFound do
        Success,Data = turtle.inspect()
        if Success then
            chestFound = Data.name == 'minecraft:chest'
            if Data.name == 'peripheralsplusone:teleporter' then
                peripheral.call("front","teleport")
                turtle.turnRight()
                turtle.turnRight()
            end
        end

        turtle.forward()
        print(state.locationX)
        state.locationX = state.locationX + 1
    end
end

function deposit()
    print("deposit")

    for i = 1 ,16 do
        turtle.select(i)
        turtle.drop()
    end
end


while true do
    goto_pickup()
    pickup()
    goto_deposit()
    deposit()
end
