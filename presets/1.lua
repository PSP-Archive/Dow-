green = Color.new(0, 255, 0)

screen:print(200, 100, "Hello World!", green)

screen.flip()
while true do
screen.waitVblankStart()
end
