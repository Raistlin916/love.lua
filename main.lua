Object = require 'classic/classic'
GameObject = require 'GameObject'
Trail = require 'Trail'
Timer = require 'hump/timer'

function love.load()
  timer = Timer()
  game_objects = {}
  game_object = createGameObject('GameObject', 100, 100)

  main_canvas = love.graphics.newCanvas(320, 240)
  main_canvas:setFilter('nearest', 'nearest')

  love.window.setMode(960, 720)
end

function love.update(dt)
  timer:update(dt)
  for i = #game_objects, 1, -1 do
    local game_object = game_objects[i]
    game_object:update(dt)
    if game_object.dead then table.remove(game_objects, i) end
  end
end

function love.draw()
  love.graphics.setCanvas(main_canvas)
  love.graphics.clear()
  for _, game_object in ipairs(game_objects) do
    game_object:draw()
  end
  love.graphics.setCanvas()

  love.graphics.draw(main_canvas, 0, 0, 0, 3, 3)
end

function createGameObject(type, x, y, opts)
  local game_object = _G[type](x, y, opts)
  table.insert(game_objects, game_object)
  return game_object
end

function love.mousepressed(x, y, button)
  if button == 1 then
    game_object.dead = true
  end
end