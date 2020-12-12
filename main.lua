function love.load()
    timer = 0
    direction = "right"
    gridXCount = 20
    gridYCount = 15
    cellSize = 15
    snakeSegments = {
        {x = 3, y = 1},
        {x = 2, y = 1},
        {x = 1, y = 1},
    }
    nextXPosition =  snakeSegments[1].x
    nextYPosition =  snakeSegments[1].y
    moveBool = true
    love.window.setMode(gridXCount*cellSize, gridYCount*cellSize)
end

function love.update(dt)
    timer = timer + dt
    if timer >= 0.15 then
        timer = 0
        if direction == "right" then
            nextXPosition = nextXPosition + 1
        elseif direction == "left" then
            nextXPosition = nextXPosition -1
        elseif direction == "up" then
            nextYPosition = nextYPosition -1
        elseif direction == "down" then
            nextYPosition = nextYPosition +1
        end

        table.insert(snakeSegments, 1, {
            x = nextXPosition, y = nextYPosition
        })
        table.remove(snakeSegments)
        moveBool = true
    end
end

function love.keypressed(key)
    if key == "right" and direction~="left" and moveBool then
        direction = "right"
        moveBool = false
    elseif key == "left" and direction~="right" and moveBool then
        direction = "left"
        moveBool = false
    elseif key == "up" and direction~="down" and moveBool then
        direction = "up"
        moveBool = false
    elseif key == "down" and direction~="up" and moveBool then
        direction = "down"
        moveBool = false
    end
end

function love.draw()
    love.graphics.setColor(.28, .28, .28 )
    love.graphics.rectangle(
        'fill',
        0,
        0,
        gridXCount * cellSize,
        gridYCount * cellSize
        )

    for segmentIndex, segment in ipairs(snakeSegments) do
        love.graphics.setColor(.6, 1, .32)
        love.graphics.rectangle(
            'fill',
            (segment.x -1) * cellSize,
            (segment.y -1) * cellSize,
            cellSize -1,
            cellSize -1
        )
    end

end