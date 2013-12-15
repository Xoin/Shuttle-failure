story_num = 0
selection = 0
onscreendialogs = {}

function onscreendialogs:load()
	font = love.graphics.newFont(9)
	love.graphics.setFont(font)
	-- art here
	png_dialog = love.graphics.newImage("art/dialogbox.png")
	onscreens[1].art = love.graphics.newImage("art/persons/blank.png")
	onscreens[2].art = love.graphics.newImage("art/dialogbox.png")
	onscreens[3].art = love.graphics.newImage("art/persons/char2.png")
	onscreens[4].art = love.graphics.newImage("art/selection.png")
	onscreens[5].art = love.graphics.newImage("art/hull.png")
	onscreens[6].art = love.graphics.newImage("art/hull2.png")
	onscreens[7].art = love.graphics.newImage("art/hull3.png")
	dialog_text = ""
	dialog_char = ""
end

function onscreendialogs:dt(dt)
	if story_num == 64 then
		love.event.quit()
	end
	if story_num > 0 then
		dialog_text = dialogs[story_num].main
		dialog_char = dialogs[story_num].speaker
	end
	if selection < 0 then
		selection = 1
	end
	if selection > 1 then
		selection = 0
	end
end

function onscreendialogs:draw()
	for i,v in ipairs(onscreens) do
    	love.graphics.draw(v.art, v.x, v.y)
    	onscreens[i].y = -150
	end
	if story_num > 0 then
		if dialogs[story_num].artdisplay > 0 then
			onscreens[dialogs[story_num].artdisplay].y = 0
		end
		onscreens[2].y = 0
		if dialogs[story_num].canskip == false then 
			if selection == 0 then
				onscreens[4].x = 5
				onscreens[4].y = 106
			end
			if selection == 1 then
				onscreens[4].x = 5
				onscreens[4].y = 116
			end
		end
	end

	love.graphics.setColor(15, 56, 15, 255)
	love.graphics.print(dialog_text, 8, 104)
	love.graphics.print(dialog_char, 6, 88)
	love.graphics.setColor(255, 255, 255, 255)
end

function love.keyreleased(key)
	if story_num > 0 then
		if dialogs[story_num].canskip == true then 
		    if key=="return" or key=="kpenter" then
		    	if dialogs[story_num].skipto == 0 then
		        	story_num = story_num + 1
		        else
		        	story_num = dialogs[story_num].skipto
		        end
		    end
		elseif dialogs[story_num].canskip == false then 
			if key=="return" or key=="kpenter" then
				if selection == 0 then
		        	story_num = dialogs[story_num].askip
				elseif selection == 1 then
		        	story_num = dialogs[story_num].bskip	
				end
		    end
			if key=="up" then
		        selection = selection - 1
		    end
		    if key=="down" then
		        selection = selection + 1
		    end
		end
		if key=="escape" then
		    love.event.quit()
		end
	end
end

dialogs = {}
for i=1,70 do
    dialog = {}
    dialog.main = "123456789012345678\nThat should be long\nlonglong"
    dialog.a = "Answer A"
    dialog.askip = 0
    dialog.bskip = 0
    dialog.speaker = "None"
    dialog.canskip = true
    dialog.canchoose = false
    dialog.skipto = 0
    dialog.artdisplay = 0
    table.insert(dialogs, dialog)
end

require "dialog_story"