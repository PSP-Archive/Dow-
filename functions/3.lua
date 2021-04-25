function drawCirc(where, x, y, radius, color)--Thanks to MagicianFB

for angle=0, 360 do
where:drawLine((math.sin( angle)*radius)+x, (math.cos(angle)*radius)+ y, (math.sin(angle+1)*radius )+x, (math.cos(angle+1)*radius )+y, color)
end
end

--Code by JorDy