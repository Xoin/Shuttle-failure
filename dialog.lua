-- Intro

onscreendialogs = {}

function onscreendialogs:load()
	-- body
end

function onscreendialogs:dt(dt)
	-- body
end

function onscreendialogs:draw()
	-- body
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

dialogs[1].main = " "
dialogs[1].a = " "
dialogs[1].b = " "
dialogs[1].qa = " "
dialogs[1].qb = " "
dialogs[1].canskip = true
dialogs[1].canchoose = false
dialogs[1].skipto = 0
dialogs[1].artdisplay = 1

dialogs[2].main = "123456789012345678\nThat should be long\nlonglongff"
dialogs[2].a = "Answer A"
dialogs[2].b = "Answer B"
dialogs[2].qa = "Question A"
dialogs[2].qb = "Question B"
dialogs[2].canskip = true
dialogs[2].canchoose = false
dialogs[2].skipto = 0
dialogs[2].artdisplay = 1