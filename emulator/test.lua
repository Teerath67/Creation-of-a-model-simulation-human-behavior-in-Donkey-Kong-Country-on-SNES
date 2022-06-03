slot = 15

--print(memory.readbyte(0x0B1F + slot*0x1))
--print(memory.readbyte(0x0BC7 + slot*0x1))

--print(string.format("0x%x", 0x0B1F + slot*0x01))

while true do
    print(memory.getmemorydomainlist())

    emu.frameadvance();
end