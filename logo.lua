intrologo = {}

function intrologo:load()
	logosound = love.audio.newSource("sound/start.wav", "static")
	logod = love.graphics.newImage("art/love.png")
end

function intrologo:draw()
	love.graphics.draw(background, 0, 0)
	for i,v in ipairs(logos) do
    	love.graphics.draw(logod, v.x, v.y)
	end
end

function intrologo:dt(dt)
	for i,v in ipairs(logos) do
		if v.y < 5 then
			v.y = v.y + dt + 0.2
		end
		if v.y >= 5  then
			--love.audio.play(logosound)
			table.remove( logos, 1 )
			onscreens[1].y = 0
			onscreens[2].y = 0
			story_num = story_num +1
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