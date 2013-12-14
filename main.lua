why = 300
whx = 200

-- RGB
--
-- Dark
-- 
--
--
--
require "dialog"

function love.load()
	love.graphics.setBackgroundColor( 15, 56, 15)
	logosound = love.audio.newSource("sound/start.wav", "static")
	logod = love.graphics.newImage("art/love.png")
	background = love.graphics.newImage("art/background.png")

	-- art here
	png_dialog = love.graphics.newImage("art/dialogbox.png")
	png_char1 = love.graphics.newImage("art/persons/blank.png")
	png_char2 = love.graphics.newImage("art/persons/char1.png")
end

function love.draw()
	love.graphics.draw(background, 0, 0)
	for i,v in ipairs(logos) do
    	love.graphics.draw(logod, v.x, v.y)
	end
	for i,v in ipairs(onscreens) do
    	love.graphics.draw(v.art, v.x, v.y)
	end
	love.graphics.draw(png_dialog, 0, 0)
	love.graphics.print("Hello", 8, 104)
end

function love.update(dt)
	for i,v in ipairs(logos) do
		if v.y < 5 then
			v.y = v.y + dt + 0.2
		end
		if v.y >= 5  then
			--love.audio.play(logosound)
			table.remove( logos, 1 )
			onscreens[1].y = 0
		end
	end
end

logos = {}
for i=1,2 do
    logo = {}
    logo.x = 15
    logo.y = -140
    table.insert(logos, logo)
end


onscreens = {}
for i=1,2 do
    onscreen = {}
    onscreen.x = 0
    onscreen.y = -140
    onscreen.art = png_char1
    table.insert(onscreens, onscreen)
end