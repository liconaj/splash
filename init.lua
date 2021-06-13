local path = ...

splash = {}
splash.image = love.graphics.newImage(path .. "/image.png")

function splash.show(options)
  options = options or {}
  local bgcolor = options.bgcolor or {.42, .75, .89}
  local duration = options.duration or 2

  local width, height = love.graphics.getDimensions()

  local image = splash.image

  local scale
  if height <= 2000 then
    scale = height/2000
  else
    scale = 1
  end

  love.graphics.clear(bgcolor)

  local x = (width - scale * image:getWidth()) / 2
  local y = (height - scale * image:getHeight()) / 2
  love.graphics.draw(image, x, y, 0, scale, scale)

  love.graphics.present()
  love.event.pump()

  love.timer.sleep(duration)
end

return splash
