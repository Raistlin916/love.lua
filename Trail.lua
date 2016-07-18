local Trail = Object:extend()

function Trail:new(type, x, y, opts)
  self.dead = false
  self.x, self.y = x, y
  self.type = type
  local opts = opts or {}
  for k, v in pairs(opts) do self[k] = v end

  timer:after(0.15, function() self.dead = true end)
end

function Trail:update(dt)

end

function Trail:update(dt)

end

function Trail:draw()
  love.graphics.circle('fill', self.x, self.y, self.r)
end


return Trail