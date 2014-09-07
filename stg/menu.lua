MenuState = {}
function MenuState:new()
end

function MenuState:load()
end

function MenuState:close()
end

function MenuState:enable()
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
		frame:Remove()
		enableState("game")
		disableState("menu")
	end
	list:AddItem(button)
	
	local button = loveframes.Create("button")
	button:SetText("leaderboards")
	button.OnClick = function(object, x, y)
		--le.push("quit")
	end
	list:AddItem(button)
	
	local button = loveframes.Create("button")
	button:SetText("settings")
	button.OnClick = function(object, x, y)
		--le.push("quit")
	end
	list:AddItem(button)
	
	local button = loveframes.Create("button")
	button:SetText("about")
	button.OnClick = function(object, x, y)
		--le.push("quit")
	end
	list:AddItem(button)
	
	local button = loveframes.Create("button")
	button:SetText("exit")
	button.OnClick = function(object, x, y)
		le.push("quit")
	end
	list:AddItem(button)
end

function MenuState:disable()
	
end

function MenuState:update(dt)
end

function MenuState:draw()
end

function MenuState:keypressed(key, unicode)
end

function MenuState:keyreleased(key, unicode)
end

function MenuState:mousepressed(x, y, button)
end

function MenuState:mousereleased(x, y, button)
end