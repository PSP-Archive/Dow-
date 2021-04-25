function printAllLines(datei,color)
y=10
zeilen = {}
datei = io.open(datei,"r") 
for line in datei:lines() do
zeilen[line] = line
y=y+10
screen:print(0,y,zeilen[line],color)
end
datei:close()
end

--Code by bumuckl