sens = 64
x0 = 0
y0 = 0

pad = Controls.read()
dx = pad:analogX()
dy = pad:analogY()
if dx > 30 then
x0 = x0 + (math.abs(pad:analogX())/sens)
end

if dx < -30 then
x0 = x0 - (math.abs(pad:analogX())/sens)
end

if dy > 30 then
y0 = y0 + (math.abs(pad:analogY())/sens)
end

if dy < -30 then
y0 = y0 - (math.abs(pad:analogY())/sens)
end

--Code by Bumuckl