lg = love.graphics
lk = love.keyboard
lm = love.math
lw = love.window
le = love.event
math.randomseed(os.time())
math.random()math.random()
local log = require("lib/lovebird")
tween = require("lib/tween")
require("lib/loveframes")
require("lib/stateManager")
require("lib/lovelyMoon")
require("stg/game")
require("stg/menu")
require("stg/pause")
cube = love.graphics.newImage('cube.png')

function love.load()
	xsize, ysize = lg.getWidth(), lg.getHeight()
	love.graphics.setBackgroundColor(104, 136, 248)
	addState(GameState, "game")
	addState(MenuState, "menu")
	addState(PauseState, "pause")
	
	enableState("menu")
end

function love.keypressed( key, unicode )
	loveframes.keypressed( key, unicode )
	lovelyMoon.keypressed( key, unicode )
end

function love.keyreleased( unicode )
	loveframes.keyreleased( key )
	lovelyMoon.keyreleased( key, unicode )
end

function love.textinput( text )
	loveframes.textinput( text )
end

function love.mousepressed(x, y, btn)
	loveframes.mousepressed(x, y, btn)
	lovelyMoon.mousepressed(x, y, btn)
end

function love.mousereleased(x,y,btn)
	loveframes.mousereleased(x, y, btn)
	lovelyMoon.mousereleased(x, y, btn)
end

function love.update(dt)
	if dt > 0.05 then dt = 0.05 end
	loveframes.update(dt)
	tween.update(dt)
	lovelyMoon.update(dt)
end

function love.draw()
	loveframes.draw()
	lovelyMoon.draw()
end