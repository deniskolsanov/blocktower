GameState = {}
function GameState:new()
	local gs = {}
	gs = setmetatable(gs, self)
	self.__index = self
	_gs = gs
  return gs
end

function GameState:load()
	love.physics.setMeter(50)
  world = love.physics.newWorld(0, 9.81*50, true)
	world:setSleepingAllowed( false )
	px, py = 0, 0
	add( "box", xsize / 2, ysize, 400, 50, 0, { 250, 250, 100 } )
	Game = {
		function()
			local i = 1
			local temp = add( "box", Game.x, Game.y + 100 * ( i - 1 ), 50, 50, 0, { 250, 250, 100 }, "sleep" )
			local temp2 = temp:getUserData()
			temp2.Game = i
			temp:setUserData( temp2 )
		end,
		function()
			local i = 2
			local temp = add( "box", Game.x, Game.y + 100 * ( i - 1 ), 100, 50, 0, { 250, 250, 100 }, "sleep" )
			local temp2 = temp:getUserData()
			temp2.Game = i
			temp:setUserData( temp2 )
		end,
		x = xsize - 100,
		y = 100
	}
	Game2 = {}
	for i = 1, #Game do
		Game[i]()
	end
end

function GameState:close()
	world:destroy()
	Game, Game2, time = nil, nil, nil
	loveframes.util.RemoveAll()
end

function GameState:enable()
	time = love.timer.getTime()
	
	local button = loveframes.Create("button", base)
	button:SetWidth(80)
	button:SetHeight(40)
	button:SetX( xsize - 80 )
	button:SetText("Pause")
	button.OnClick = function(object, x, y)
		disableState("game")
		enableState("pause")
	end
end

function GameState:disable()
	loveframes.util.RemoveAll()
end

function GameState:keypressed( key, isrepeat )
	if key == "escape" then
		love.event.push( 'quit' )
	end
end

function GameState:mousepressed(x, y, btn)
	if btn == "l" then
		fix_body = nil
		q = world:getBodyList()
		for i = 1, #q do
			local temp = q[i]:getUserData()
			if temp.shape:testPoint( temp.body:getX(), temp.body:getY(), temp.body:getAngle(), x, y ) then
				fix_body = q[i]
			end
		end
		if fix_body then
			if not fix_body:isActive() then
				Game2[ fix_body:getUserData().Game ] = true
			end
			fix_body:setActive( true )
			fix = love.physics.newMouseJoint( fix_body, x - px, y - py )
			fix:setMaxForce( 10000 )
		end
	end
end

function GameState:mousereleased(x,y,btn)
	if fix then fix:destroy() end
	fix = nil
end

function GameState:update(dt)
	if dt > 0.05 then dt = 0.05 end
	if fix then
		fix:setTarget( love.mouse.getX() - px, love.mouse.getY() - py )
		local temp = fix_body:getUserData().Game
		if love.mouse.getX() - px < xsize - 200 and Game2[ temp ] == true then
			Game[ temp ]()
			Game2[ temp ] = false
		end
	end
	world:update(dt)
	if nil and love.timer.getTime() - time > 0.5 then
		time = love.timer.getTime()
		for i = 1, #q do
			local temp = q[i].body:getUserData()
			if temp and temp.Game and q[i].body:getY() > ysize then
				--Game[temp.Game(  )]
			end
		end
	end
end

function GameState:draw()
	lg.push()
	lg.translate( px, py )
	q = world:getBodyList()
	for i = 1, #q do
		local temp = q[i]:getUserData()
		love.graphics.setColor( temp.color )
		if temp.type == "box" then
			if temp.body:getType() == "static" then
				lg.polygon( "fill", temp.body:getWorldPoints( temp.shape:getPoints() ) )
			else
				lg.push()
				lg.translate( temp.body:getX(), temp.body:getY() )
				lg.scale( 50 / cube:getWidth(), 50 / cube:getHeight() )
				lg.rotate( temp.body:getAngle() )
				lg.draw( cube, -cube:getWidth() / 2, -cube:getHeight() / 2 )
				lg.pop()
			end
		elseif temp.type == "circle" then
			lg.circle("fill", temp.body:getX(), temp.body:getY(), temp.shape:getRadius())
		end
	end
	lg.pop()
end

function add( type, x, y, a1, a2, a3, a4, a5, a6 )
	local temp, color, body
	if type == "circle" then
		temp = love.physics.newCircleShape( 0, 0, a1 )
		color = a2
		body = a3
	elseif type == "box" then
		temp = love.physics.newRectangleShape( 0, 0, a1, a2, a3 )
		color = a4
		body = a5
	end
	local t = body
	if body == "sleep" then
		t = "dynamic"
	end
	local temp2 = love.physics.newBody( world, x, y, t )
  local temp3 = love.physics.newFixture( temp2, temp )
	if body == "sleep" then
		temp2:setActive( false )
	end
	temp2:setUserData( { type = type, shape = temp, body = temp2, fix = temp3, color = color } )
	return temp2
end