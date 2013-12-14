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
require "logo"
story_num = 1

function love.load()
	love.graphics.setBackgroundColor( 15, 56, 15)
	intrologo:load()
	background = love.graphics.newImage("art/background.png")
	font = love.graphics.newFont(9)
	love.graphics.setFont(font)
	-- art here
	png_dialog = love.graphics.newImage("art/dialogbox.png")
	onscreens[1].art = love.graphics.newImage("art/persons/blank.png")
	onscreens[2].art = love.graphics.newImage("art/dialogbox.png")
	dialog_text = ""
end

function love.draw()
	intrologo:draw()
	for i,v in ipairs(onscreens) do
    	love.graphics.draw(v.art, v.x, v.y)
	end
	love.graphics.print(dialog_text, 8, 104)
end

function love.update(dt)
	intrologo:dt(dt)
	if dialog_text == dialogs[story_num].a then
		dialog_text = dialogs[story_num].main
		story_num = story_num + 1
	end
end