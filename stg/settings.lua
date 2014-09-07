SettingsState = {}
function SettingsState:new()
end

function SettingsState:load()
end

function SettingsState:close()
end

function SettingsState:enable()
	local list = loveframes.Create("list", frame)
	list:SetPos(0, 0)
	list:SetSize(xsize * 0.4, 155)
	list:SetPadding(5)
	list:SetSpacing(5)
	list:Clear()
	list:CenterWithinArea(0, 0, xsize, ysize)
	
	local panel = loveframes.Create("panel", list)
	panel:SetHeight(25)
	slider1 = loveframes.Create("slider", panel)
	slider1:SetPos(90, 2)
	slider1:SetWidth(xsize * 0.4 - 110)
	slider1:SetMinMax(0, 100)
	slider1:SetValue(80)
	slider1.OnValueChanged = function(object2, value)
		text1:SetText("sound: "..math.floor( slider1:GetValue() ).."%")
	end
	text1 = loveframes.Create("text", panel)
	text1:SetPos(5, 5)
	text1:SetText("sound: "..math.floor( slider1:GetValue() ).."%")
	
	local panel = loveframes.Create("panel", list)
	panel:SetHeight(25)
	slider2 = loveframes.Create("slider", panel)
	slider2:SetPos(90, 2)
	slider2:SetWidth(xsize * 0.4 - 110)
	slider2:SetMinMax(0, 100)
	slider2:SetValue(80)
	slider2.OnValueChanged = function(object2, value)
		text2:SetText("music: "..math.floor( slider2:GetValue() ).."%")
	end
	text2 = loveframes.Create("text", panel)
	text2:SetPos(5, 5)
	text2:SetText("music: "..math.floor( slider2:GetValue() ).."%")
	
	local button = loveframes.Create("button")
	button:SetText("reserved")
	button.OnClick = function(object, x, y)
		--le.push("quit")
	end
	list:AddItem(button)
	
	local button = loveframes.Create("button")
	button:SetText("reserved")
	button.OnClick = function(object, x, y)
		--le.push("quit")
	end
	list:AddItem(button)
	
	local button = loveframes.Create("button")
	button:SetText("back")
	button.OnClick = function(object, x, y)
		disableState("Settings")
		enableState("menu")
	end
	list:AddItem(button)
end

function SettingsState:disable()
	loveframes.util.RemoveAll()
end

function SettingsState:update(dt)
end

function SettingsState:draw()
end

function SettingsState:keypressed(key, unicode)
end

function SettingsState:keyreleased(key, unicode)
end

function SettingsState:mousepressed(x, y, button)
end

function SettingsState:mousereleased(x, y, button)
end