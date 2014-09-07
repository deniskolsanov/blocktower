LeaderboardState = {}
function LeaderboardState:new()
end

function LeaderboardState:load()
end

function LeaderboardState:close()
end

function LeaderboardState:enable()
	local list = loveframes.Create("columnlist", frame)
	list:SetSize(xsize * 0.6, ysize * 0.6)
	list:CenterWithinArea(0, 0, xsize, ysize)
	list:AddColumn("Name")
	list:AddColumn("Mode")
	list:AddColumn("Score")
	list:AddRow("player", "easy", 120)
	list:AddRow("Opera", "hard", 1024)
end

function LeaderboardState:disable()
	loveframes.util.RemoveAll()
end

function LeaderboardState:update(dt)
end

function LeaderboardState:draw()
end

function LeaderboardState:keypressed(key, unicode)
end

function LeaderboardState:keyreleased(key, unicode)
end

function LeaderboardState:mousepressed(x, y, button)
end

function LeaderboardState:mousereleased(x, y, button)
end