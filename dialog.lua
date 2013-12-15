-- Intro

story_num = 0

onscreendialogs = {}

function onscreendialogs:load()
	font = love.graphics.newFont(9)
	love.graphics.setFont(font)
	-- art here
	png_dialog = love.graphics.newImage("art/dialogbox.png")
	onscreens[1].art = love.graphics.newImage("art/persons/blank.png")
	onscreens[2].art = love.graphics.newImage("art/dialogbox.png")
	onscreens[3].art = love.graphics.newImage("art/dialogbox.png")
	dialog_text = ""
end

function onscreendialogs:dt(dt)
	if story_num > 0 then
		dialog_text = story_num
	end
end

function onscreendialogs:draw()
	for i,v in ipairs(onscreens) do
    	love.graphics.draw(v.art, v.x, v.y)
	end
	love.graphics.print(dialog_text, 8, 104)
end

function love.keyreleased(key)
	if dialogs[story_num].canskip == true then 
	    if key=="return" or key=="kpenter" then
	        story_num = story_num + 1
	    end 
	end
	if key=="escape" then
	    love.event.quit()
	end 
end

dialogs = {}
for i=1,12 do
    dialog = {}
    dialog.main = "123456789012345678\nThat should be long\nlonglong"
    dialog.a = "Answer A"
    dialog.b = "Answer B"
    dialog.qa = "Question"
    dialog.qb = "Question"
    dialog.canskip = false
    dialog.canchoose = false
    dialog.skipto = 0
    dialog.artdisplay = 0
    table.insert(dialogs, dialog)
end

dialogs[1].main = "The year is 2046, you are in a\nspace station oribiting mars,\nyou are about to witness..."
dialogs[1].canskip = true
dialogs[1].artdisplay = 1

dialogs[2].main = "a series of events that will change your life."
dialogs[2].canskip = false
dialogs[2].artdisplay = 1