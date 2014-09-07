PauseState = {}
function PauseState:new()
end

function PauseState:load()
end

function PauseState:close()
end

function PauseState:enable()
	local button = loveframes.Create("button", base)
	button:SetWidth(80)
	button:SetHeight(40)
	button:SetX( xsize - 80 )
	button:SetText("Play")
	button.OnClick = function(object, x, y)
		disableState("pause")
		enableState("game")
	end
end

function PauseState:disable()
	loveframes.util.RemoveAll()
end

function PauseState:update(dt)
end

function PauseState:draw()
	GameState:draw()
end

function PauseState:keypressed(key, unicode)
end

function PauseState:keyreleased(key, unicode)
end

function PauseState:mousepressed(x, y, button)
end

function PauseState:mousereleased(x, y, button)
end