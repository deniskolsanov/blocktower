function menu_main()
	local frame = loveframes.Create("frame")
	frame:SetWidth(xsize * 0.4)
	frame:SetHeight(155)
	frame:SetName("menu")
	frame:ShowCloseButton(false)
	frame:SetDraggable(false)
	frame:CenterWithinArea(0, 0, xsize, ysize)
	
	local list = loveframes.Create("list", frame)
	list:SetPos(0, 0)
	list:SetSize(xsize * 0.4, 155)
	list:SetPadding(5)
	list:SetSpacing(5)
	list:Clear()
	local button = loveframes.Create("button")
	button:SetText("play")
	button.OnClick = function(object, x, y)
		swap("game")
	end
	list:AddItem(button)
end

GameState = {}
function GameState:new()
end

function GameState:load()
end

function GameState:close()
end

function GameState:enable()
end

function GameState:disable()
end

function GameState:update(dt)
end

function GameState:draw()
end

function GameState:keypressed(key, unicode)
end

function GameState:keyreleased(key, unicode)
end

function GameState:mousepressed(x, y, button)
end

function GameState:mousereleased(x, y, button)
end