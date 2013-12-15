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

function love.load()
	love.graphics.setBackgroundColor( 15, 56, 15)
	intrologo:load()
	background = love.graphics.newImage("art/background.png")
	onscreendialogs:load()
end

function love.draw()
	intrologo:draw()
	onscreendialogs:draw()
end

function love.update(dt)
	intrologo:dt(dt)
	onscreendialogs:dt(dt)
end