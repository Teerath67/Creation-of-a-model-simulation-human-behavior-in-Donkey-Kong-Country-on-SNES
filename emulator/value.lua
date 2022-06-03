memory.usememorydomain("CARTROM")

hexad = 0x00190000
hexaf = 0x001914FF
sizex = 158
sizey = 16
map = {}

for i = 0, sizex-1 do
    temp = {}
	
    
    for o = 0, sizey-1 do      
		if memory.readbyte(hexad + 0x20 * i + 0x02 * o + 0x01) == 0x40 or memory.readbyte(hexad + 0x20 * i + 0x02 * o + 0x01) == 0x41 then
			temp[o] = memory.read_u16_le(hexad + 0x20 * i + 0x02 * o) - 0x4000
		elseif memory.readbyte(hexad + 0x20 * i + 0x02 * o + 0x01) == 0x80 or memory.readbyte(hexad + 0x20 * i + 0x02 * o + 0x01) == 0x81 then
			temp[o] = memory.read_u16_le(hexad + 0x20 * i + 0x02 * o) - 0x8000
		elseif memory.readbyte(hexad + 0x20 * i + 0x02 * o + 0x01) == 0xC0 or memory.readbyte(hexad + 0x20 * i + 0x02 * o + 0x01) == 0xC1 then
			temp[o] = memory.read_u16_le(hexad + 0x20 * i + 0x02 * o) - 0xC000
		else
			temp[o] = memory.read_u16_le(hexad + 0x20 * i + 0x02 * o)
		end
    end

    map[i] = temp;
end

memory.usememorydomain("WRAM")


file = io.open("test.txt", "w")

for o = 0, sizey-1 do
    for i = 0, sizex-1 do
        file:write(map[i][o] .. " ")
    end
    file:write("\n")
end

file:close()

emu.frameadvance();
