onscreens = {}
for i=1,12 do
    onscreen = {}
    onscreen.x = 0
    onscreen.y = -140
    onscreen.art = love.graphics.newImage("art/persons/char1.png")
    table.insert(onscreens, onscreen)
end