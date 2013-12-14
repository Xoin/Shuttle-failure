--
-- Please run while you still can!
--
-- RGB
--
-- Dark 0x0f380f 15 56 15
-- Still dark 0x306230 48 98 48
-- Bit light 0x8bac0f 139 172 15
-- Light 0x9bbc0f 155 188 15
--
--
require "dialog"
require "char_data"

story_num = 1

function love.load()
	love.graphics.setBackgroundColor( 15, 56, 15)
	logosound = love.audio.newSource("sound/start.wav", "static")
	logod = love.graphics.newImage("art/love.png")
	background = love.graphics.newImage("art/background.png")

	-- art here
	png_dialog = love.graphics.newImage("art/dialogbox.png")

	dialog_text = ""
end

function love.draw()
	love.graphics.draw(background, 0, 0)
	for i,v in ipairs(logos) do
    	love.graphics.draw(logod, v.x, v.y)
	end
	for i,v in ipairs(onscreens) do
    	love.graphics.draw(v.art, v.x, v.y)
	end
	love.graphics.print(dialog_text, 8, 104)
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
			onscreens[1].art = love.graphics.newImage("art/persons/blank.png")
			onscreens[2].y = 0
			onscreens[2].art = love.graphics.newImage("art/dialogbox.png")
			dialog_text = dialogs[story_num].a 
			story_num = story_num + 1
		end
	end
	if dialog_text == dialogs[story_num].a then
		dialog_text = dialogs[story_num].main
	end
end

logos = {}
for i=1,2 do
    logo = {}
    logo.x = 15
    logo.y = -140
    table.insert(logos, logo)
end