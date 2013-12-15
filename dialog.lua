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
	dialog_text = ""
	dialog_char = ""
end

function onscreendialogs:dt(dt)
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
    	onscreens[i].y = -140
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
for i=1,30 do
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

-- Intro
dialogs[1].main = "The year is 2046, you are in a\nspace shuttle oribiting mars,\nyou are about to witness..."
dialogs[1].artdisplay = 0
dialogs[1].speaker = "Narrator"

dialogs[2].main = "a series of events that will\nchange your life."
dialogs[2].artdisplay = 0
dialogs[2].speaker = "Narrator"

dialogs[3].main = "Excuse me sir! There is a hole\nin the hull! All but one escape\npod is working!"
dialogs[3].artdisplay = 3
dialogs[3].speaker = "Computer"

dialogs[4].main = "What do you advice?\nWell see you later!"
dialogs[4].askip = 5
dialogs[4].bskip = 6
dialogs[4].canskip = false
dialogs[4].artdisplay = 1
dialogs[4].speaker = "You"

dialogs[5].main = "Select one of your best men\nto use the last escape pod."
dialogs[5].artdisplay = 3
dialogs[5].skipto = 7
dialogs[5].speaker = "Computer"

dialogs[6].main = "Just sit still while I accidently\nopen the airlock."
dialogs[6].artdisplay = 3
dialogs[6].speaker = "Computer"

dialogs[7].main = "Well give me a list then."
dialogs[7].artdisplay = 1
dialogs[7].speaker = "You"

dialogs[8].main = "Well this shuttle has a crew of \n5 we have: Ernest, Virgil, \nWillard, Sonia, and you. Not..."
dialogs[8].artdisplay = 3
dialogs[8].speaker = "Computer"

dialogs[9].main = "all of them can survive until \nthey get rescued."
dialogs[9].artdisplay = 3
dialogs[9].speaker = "Computer"

dialogs[10].main = "We need to thin down the\nlist then. Can you get the\nmedical lists for me?"
dialogs[10].artdisplay = 1
dialogs[10].speaker = "You"

dialogs[11].main = "It won't take more than a few\nseconds to get those."
dialogs[11].artdisplay = 3
dialogs[11].speaker = "Computer"

dialogs[12].main = "*bzzzz*..."
dialogs[12].artdisplay = 3
dialogs[12].speaker = "Computer"

dialogs[13].main = "*bzzzz* *bzzzz*..."
dialogs[13].artdisplay = 3
dialogs[13].speaker = "Computer"

dialogs[14].main = "*bzzzz* *bzzzz* *bzzzz*..."
dialogs[14].artdisplay = 3
dialogs[14].speaker = "Computer"

dialogs[15].main = "*bzzzz* *bzzzz* *bzzzz*\n*ping*..."
dialogs[15].artdisplay = 3
dialogs[15].speaker = "Computer"

dialogs[16].main = "There it is."
dialogs[16].artdisplay = 3
dialogs[16].speaker = "Computer"

dialogs[17].main = "You took your time.\nWell read the list."
dialogs[17].canskip = false
dialogs[17].askip = 18
dialogs[17].bskip = 21
dialogs[17].artdisplay = 1
dialogs[17].speaker = "You"

dialogs[18].main = "If you didn't strip me for parts\nto make a coffee machine I\ncould work faster!"
dialogs[18].artdisplay = 3
dialogs[18].speaker = "Computer"

dialogs[19].main = "Oh shut it wiseguy. Just give\nthe damn list before we all\ndie!"
dialogs[19].artdisplay = 1
dialogs[19].speaker = "You"

dialogs[20].main = "Right, saying please wouldn't\nkill you."
dialogs[20].artdisplay = 3
dialogs[20].speaker = "Computer"

dialogs[21].main = "Right, saying please wouldn't\nkill you."
dialogs[21].artdisplay = 3
dialogs[21].speaker = "Computer"