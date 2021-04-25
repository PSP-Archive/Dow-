green = Color.new(0, 255, 0)
black = Color.new(0,0,0)
white = Color.new(255,255,255)
red = Color.new(255,0,0)

oldPad = Controls.read()

while true do
pad = Controls.read()

if pad ~= oldPad then
oldPad = pad
end

screen.flip()
screen.waitVblankStart()
end 