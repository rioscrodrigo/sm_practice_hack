local CAT = "routeb" -- pkdr, routea, routeb, hundo

local last_state = {} -- holds all state that has been changed up untill last save

local preset_output = ""
local last_step = nil

local MEMTRACK = { -- {{{
    { 0x07C3, 0x6, 'GFX Pointers' },
    { 0x07F3, 0x2, 'Music Bank' },
    { 0x07F5, 0x2, 'Music Track' },
    { 0x078B, 0x2, 'Elevator Index' },
    { 0x078D, 0x2, 'DDB' },
    { 0x078F, 0x2, 'DoorOut Index' },
    { 0x079B, 0x2, 'MDB' },
    { 0x079F, 0x2, 'Region' },

    --[[
    { 0x08F7, 0x2, 'How many blocks X the screen is scrolled?' },
    { 0x08F9, 0x2, 'How many blocks Y the screen is scrolled? (up = positive)' },
    { 0x08FB, 0x2, 'How many blocks X Layer 2 is scrolled?' },
    { 0x08FD, 0x2, 'How many blocks Y Layer 2 is scrolled? (up = positive)' },
    { 0x08FF, 0x2, 'How many blocks X the screen was scrolled previously (Checked to know when to update blocks)' },
    { 0x0901, 0x2, 'How many blocks Y the screen was scrolled previously (Checked to know when to update blocks) (up = positive)' },
    { 0x0903, 0x2, 'How many blocks X Layer 2 was scrolled previously (Checked to know when to update blocks)' },
    { 0x0905, 0x2, 'How many blocks Y Layer 2 was scrolled previously (Checked to know when to update blocks) (up = positive)' },
    { 0x0907, 0x2, 'How many blocks X BG1 is scrolled?' },
    { 0x0909, 0x2, 'How many blocks Y BG1 is scrolled? (up = positive)' },
    { 0x090B, 0x2, 'How many blocks X BG2 is scrolled?' },
    { 0x090D, 0x2, 'How many blocks Y BG2 is scrolled? (up = positive)' },
    ]]
    { 0x090F, 0x2, 'Screen subpixel X position.' },
    { 0x0911, 0x2, 'Screen X position in pixels' },
    { 0x0913, 0x2, 'Screen subpixel Y position' },
    { 0x0915, 0x2, 'Screen Y position in pixels' },
    --[[
    { 0x0917, 0x2, 'Layer 2 X scroll in room in pixels?' },
    { 0x0919, 0x2, 'Layer 2 Y scroll in room in pixels? (up = positive)' },
    { 0x091B, 0x2, 'BG2 scroll percent to screen scroll (0 = 100, 1 = ?) (1 byte for X, 1 byte for Y)' },
    { 0x091D, 0x2, 'BG1 X scroll offset due to room transitions (Translates between screen scroll and BG1 scroll)' },
    { 0x091F, 0x2, 'BG1 Y scroll offset due to room transitions (Translates between screen scroll and BG1 scroll)' },
    { 0x0921, 0x2, 'BG2 X scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)' },
    { 0x0923, 0x2, 'BG2 Y scroll offset due to room transitions (Translates between Layer 2 scroll and BG2 scroll)' },
    { 0x0925, 0x2, 'How many times the screen has scrolled? Stops at 40.' },
    { 0x0927, 0x2, 'X offset of room entrance for room transition (multiple of 100, screens)' },
    { 0x0929, 0x2, 'Y offset of room entrance for room transition (multiple of 100, screens. Adjusted by 20 when moving up)' },
    { 0x092B, 0x2, 'Movement speed for room transitions (subpixels per frame of room transition movement)' },
    { 0x092D, 0x2, 'Movement speed for room transitions (pixels per frame of room transition movement)' },
    --]]
    { 0x093F, 0x2, 'Ceres escape flag' },

    { 0x09A2, 0x2, 'Equipped Items' },
    { 0x09A4, 0x2, 'Collected Items' },
    { 0x09A6, 0x2, 'Beams' },
    { 0x09A8, 0x2, 'Beams' },
    { 0x09C0, 0x2, 'Manual/Auto reserve tank' },
    { 0x09C2, 0x2, 'Health' },
    { 0x09C4, 0x2, 'Max helath' },
    { 0x09C6, 0x2, 'Missiles' },
    { 0x09C8, 0x2, 'Max missiles' },
    { 0x09CA, 0x2, 'Supers' },
    { 0x09CC, 0x2, 'Max supers' },
    { 0x09CE, 0x2, 'Pbs' },
    { 0x09D0, 0x2, 'Max pbs' },
    -- { 0x09D2, 0x2, 'Current selected weapon' },
    { 0x09D4, 0x2, 'Max reserves' },
    { 0x09D6, 0x2, 'Reserves' },
    -- { 0x0A04, 0x2, 'Auto-cancel item' },
    { 0x0A1C, 0x2, 'Samus position/state' },
    { 0x0A1E, 0x2, 'More position/state' },
    { 0x0A68, 0x2, 'Flash suit' },
    { 0x0A76, 0x2, 'Hyper beam' },
    { 0x0AF6, 0x2, 'Samus X' },
    { 0x0AFA, 0x2, 'Samus Y' },
    { 0x0B3F, 0x2, 'Blue suit' },
    { 0xD7C0, 0x60, 'SRAM copy' }, -- Prob not doing much?
    { 0xD820, 0x100, 'Events, Items, Doors' },
    -- { 0xD840, 0x40, 'Items' },
    -- { 0xD8B0, 0x40, 'Doors' },
    -- { 0xD914, 0x2, 'Game mode?' },

} -- }}}

local SEGMENTS = {
    ["routea"] = { -- {{{
        { ["name"] = "Crateria", ["steps"] = {} },
        { ["name"] = "Brinstar", ["steps"] = {} },
        { ["name"] = "Upper Norfair", ["steps"] = {} },
    }, -- }}}
    ["routeb"] = { -- {{{
        { ["name"] = "Crateria", ["steps"] = {} },
        { ["name"] = "Brinstar", ["steps"] = {} },
        { ["name"] = "Upper Norfair", ["steps"] = {} },
        { ["name"] = "Maridia", ["steps"] = {} },
        { ["name"] = "Wrecked Ship", ["steps"] = {} },
        { ["name"] = "Lower Norfair", ["steps"] = {} },
        { ["name"] = "Red Tower", ["steps"] = {} },
        { ["name"] = "Maridia Return", ["steps"] = {} },
        { ["name"] = "Backtracking", ["steps"] = {} },
        { ["name"] = "Tourian", ["steps"] = {} },
    }, -- }}}
}

local STEPS = {
    ["routea"] = { -- {{{
        -- Crateria
        [3482] = { ["segment_no"] = 1, ["name"] = "Ship" },
        [6420] = { ["segment_no"] = 1, ["name"] = "Morph" },
        [12140] = { ["segment_no"] = 1, ["name"] = "Elevator" },
        [15907] = { ["segment_no"] = 1, ["name"] = "Elevator Return" },
        [21247] = { ["segment_no"] = 1, ["name"] = "Climb" },
        [29109] = { ["segment_no"] = 1, ["name"] = "Bomb Torizo" },
        [42481] = { ["segment_no"] = 1, ["name"] = "Crateria Early Supers" },
        [47300] = { ["segment_no"] = 1, ["name"] = "Blue Gate Glich" }, --Check if works
        [51783] = { ["segment_no"] = 1, ["name"] = "Elevator 3" },
        [65109] = { ["segment_no"] = 1, ["name"] = "Spazer" },  
        -- Brinstar
        [72088] = { ["segment_no"] = 2, ["name"] = "Green Brinstar Elevator" },
        [77994] = { ["segment_no"] = 2, ["name"] = "SporeSpawn" },
        [99667] = { ["segment_no"] = 2, ["name"] = "SpikeWay" },
        [102675] = { ["segment_no"] = 2, ["name"] = "Red Brinstar" },
        [112854] = { ["segment_no"] = 2, ["name"] = "E-Tank Hallway" },
        [117284] = { ["segment_no"] = 2, ["name"] = "Kraids Lair" },
        [122629] = { ["segment_no"] = 2, ["name"] = "Kraid" },
        [130326] = { ["segment_no"] = 2, ["name"] = "Water Tank" },
        -- Upper Norfair
        [135536] = { ["segment_no"] = 3, ["name"] = "Upper Norfair Elevator" },
        
    }, -- }}}
    ["routeb"] = { -- {{{
        -- Crateria
        [3760] = { ["segment_no"] = 1, ["name"] = "Ship" },
        [6420] = { ["segment_no"] = 1, ["name"] = "Morph" },
        [11231] = { ["segment_no"] = 1, ["name"] = "Elevator" },
        [15167] = { ["segment_no"] = 1, ["name"] = "Elevator 2" },
        [19396] = { ["segment_no"] = 1, ["name"] = "Climb" },
        [29009] = { ["segment_no"] = 1, ["name"] = "Bomb Torizo" },
        -- Brinstar
        [43252] = { ["segment_no"] = 2, ["name"] = "Green Brinstar Elevator" },
        [55460] = { ["segment_no"] = 2, ["name"] = "SporeSpawn" },
        [73650] = { ["segment_no"] = 2, ["name"] = "Green Hill" },
        [78518] = { ["segment_no"] = 2, ["name"] = "SpringBall" },
        [91450] = { ["segment_no"] = 2, ["name"] = "SpikeWay" },
        [96194] = { ["segment_no"] = 2, ["name"] = "Red Brinstar" },
        [103990] = { ["segment_no"] = 2, ["name"] = "E-Tank Hallway" },
        [108698] = { ["segment_no"] = 2, ["name"] = "Kraids Lair" },
        [113663] = { ["segment_no"] = 2, ["name"] = "Kraid" },
        [124015] = { ["segment_no"] = 2, ["name"] = "Water Tank" },
        -- Upper Norfair
        [130825] = { ["segment_no"] = 3, ["name"] = "Upper Norfair Elevator" },
        [135532] = { ["segment_no"] = 3, ["name"] = "Hot Spring" },
        [139458] = { ["segment_no"] = 3, ["name"] = "Super Missiles" },
        [145153] = { ["segment_no"] = 3, ["name"] = "Unknown" },
        [151438] = { ["segment_no"] = 3, ["name"] = "Road to Ice Beam" },
        [157278] = { ["segment_no"] = 3, ["name"] = "The Four Horsemen" },
        [169249] = { ["segment_no"] = 3, ["name"] = "Bubble Mountain Supers" },
        [172219] = { ["segment_no"] = 3, ["name"] = "Blue Gate Glich" },
        [179923] = { ["segment_no"] = 3, ["name"] = "Speed Way" },
        [186128] = { ["segment_no"] = 3, ["name"] = "Speed Ball" },
        [190389] = { ["segment_no"] = 3, ["name"] = "Zero Mission" },
        [197761] = { ["segment_no"] = 3, ["name"] = "Energy Spark" },
        [202599] = { ["segment_no"] = 3, ["name"] = "Spark Again" },
        [211580] = { ["segment_no"] = 3, ["name"] = "GrappleBeam" },
        [217562] = { ["segment_no"] = 3, ["name"] = "Grapple Way" },
        [224813] = { ["segment_no"] = 3, ["name"] = "The Real Bubble Mountain" },
        -- Maridia 
        [228530] = { ["segment_no"] = 4, ["name"] = "Maridia Elevator" },
        [235504] = { ["segment_no"] = 4, ["name"] = "Water Jump" },
        [240651] = { ["segment_no"] = 4, ["name"] = "Botwoon" },
        [256117] = { ["segment_no"] = 4, ["name"] = "Sand Pit" },
        [264531] = { ["segment_no"] = 4, ["name"] = "GrappleWay UnderWater" },
        -- Wrecked Ship
        [285089] = { ["segment_no"] = 5, ["name"] = "Wrecked Ship Elevator" },
        [294217] = { ["segment_no"] = 5, ["name"] = "Wrecked Ship" },
        [299974] = { ["segment_no"] = 5, ["name"] = "Phantoon" },
        [314075] = { ["segment_no"] = 5, ["name"] = "Wave Beam" },
        -- Lower Norfair
        [321381] = { ["segment_no"] = 6, ["name"] = "Maridia Elevator 2" },
        [326055] = { ["segment_no"] = 6, ["name"] = "Upper Norfair Elevator 2" },
        [333387] = { ["segment_no"] = 6, ["name"] = "Road to Lower Norfair" },
        [339924] = { ["segment_no"] = 6, ["name"] = "LavaDive" },
        [343424] = { ["segment_no"] = 6, ["name"] = "Lower Norfair Elevator" },
        [348550] = { ["segment_no"] = 6, ["name"] = "Screw Attack" },
        [353459] = { ["segment_no"] = 6, ["name"] = "The Red Room" },
        [357522] = { ["segment_no"] = 6, ["name"] = "Health Refill" },
        [363296] = { ["segment_no"] = 6, ["name"] = "Metal Pirates" },
        [367282] = { ["segment_no"] = 6, ["name"] = "Ridley" },
        [378352] = { ["segment_no"] = 6, ["name"] = "Chilean Climb" },
        [382117] = { ["segment_no"] = 6, ["name"] = "Zero Mission DeJaVu" },
        [386131] = { ["segment_no"] = 6, ["name"] = "Elevator Climb" },
        -- Red Tower
        [388099] = { ["segment_no"] = 7, ["name"] = "Red Tower Elevator" },
        [391509] = { ["segment_no"] = 7, ["name"] = "Red Tower Climb" },
        [394643] = { ["segment_no"] = 7, ["name"] = "Water Spike Corridor" },
        -- Maridia Return
        [396799] = { ["segment_no"] = 8, ["name"] = "Maridia Entrace" },
        [400204] = { ["segment_no"] = 8, ["name"] = "Red Tubes" },
        [403212] = { ["segment_no"] = 8, ["name"] = "Halfie Spark" },
        [407288] = { ["segment_no"] = 8, ["name"] = "Draygon" },
        [413964] = { ["segment_no"] = 8, ["name"] = "Reverse Halfie" },
        [429927] = { ["segment_no"] = 8, ["name"] = "Plasma Beam" },
        [439735] = { ["segment_no"] = 8, ["name"] = "Tube Room" },
        [443928] = { ["segment_no"] = 8, ["name"] = "Red Tubes Return" },
        -- Backtracking
        [449184] = { ["segment_no"] = 9, ["name"] = "Green Brinstar Entrace" },
        [454001] = { ["segment_no"] = 9, ["name"] = "Crateria Elevator" },
        [458263] = { ["segment_no"] = 9, ["name"] = "G4" },
        -- Tourian
        [462334] = { ["segment_no"] = 10, ["name"] = "Tourian Elevator" },
        [465094] = { ["segment_no"] = 10, ["name"] = "Metroids Room 2" },
        [466470] = { ["segment_no"] = 10, ["name"] = "Metroids Room 3" },
        [467979] = { ["segment_no"] = 10, ["name"] = "Metroids Room 4" },
        [469389] = { ["segment_no"] = 10, ["name"] = "Pirates Room" },
        [470712] = { ["segment_no"] = 10, ["name"] = "Baby Skip" },
        [477679] = { ["segment_no"] = 10, ["name"] = "Zebetite Skip" },
        
    }, -- }}}
}


--
-- Utility
--

-- orderedPairs {{{

function deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepcopy(orig_key)] = deepcopy(orig_value)
        end
        setmetatable(copy, deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end


function __genOrderedIndex( t )
    local orderedIndex = {}
    for key in pairs(t) do
        table.insert( orderedIndex, key )
    end
    table.sort( orderedIndex )
    return orderedIndex
end

function orderedNext(t, state)
    -- Equivalent of the next function, but returns the keys in the alphabetic
    -- order. We use a temporary ordered key table that is stored in the
    -- table being iterated.

    local key = nil
    --print("orderedNext: state = "..tostring(state) )
    if state == nil then
        -- the first time, generate the index
        t.__orderedIndex = __genOrderedIndex( t )
        key = t.__orderedIndex[1]
    else
        -- fetch the next value
        for i = 1,table.getn(t.__orderedIndex) do
            if t.__orderedIndex[i] == state then
                key = t.__orderedIndex[i+1]
            end
        end
    end

    if key then
        return key, t[key]
    end

    -- no more value to return, cleanup
    t.__orderedIndex = nil
    return
end

function orderedPairs(t)
    -- Equivalent of the pairs() function on tables. Allows to iterate
    -- in order
    return orderedNext, t, nil
end
-- }}}

local SLUGS = {}
local function slugify(s)
    local slug = string.gsub(string.gsub(s, "[^ A-Za-z0-9]", ""), "[ ]+", "_"):lower()
    if not SLUGS[slug] then
        SLUGS[slug] = 1
        return slug
    end

    local ret = slug
    local i = 2
    while SLUGS[ret] do
        ret = slug .. '_' .. tostring(i)
        i = i + 1
    end
    SLUGS[ret] = 1
    return ret
end

local function ucfirst(s)
    return s:sub(1,1):upper() .. s:sub(2):lower()
end

local function draw_lines(x, y, L)
    for i, line in ipairs(L) do
        gui.text(x, y + ((i - 1) * 8), line)
    end
end

local function tohex(n, size)
    size = size or 0
    return string.format("$%0" .. tostring(size) .. "X", n)
end

local function call_for_each_bank(address, fn, ...)
    assert(address < 0x7F0000 or address > 0x7FFFFF)
    for i = 0x80, 0xDF do
        fn(bit.lshift(i, 16) + bit.band(address, 0xFFFF), unpack(arg))
    end
    fn(0x7E0000 + address, unpack(arg))
end

-- local debug_file = io.open("debug.txt", "w")

local function debug(...)
    -- print(unpack(arg))
    -- debug_file:write(table.concat(arg, " ") .. "\n")
    -- debug_file:flush()
end


--
-- State
--

local function annotate_address(addr, val)
    if addr < 0x7F0000 or addr > 0x7FFFFF then
        addr = bit.band(addr, 0xFFFF)
    end

    for _, mem in pairs(MEMTRACK) do
        if mem[1] <= addr and (addr < mem[1] + mem[2]) then
            return mem[3]
        end
    end

    return "(" .. tohex(addr, 4) .. ") ??"
end

local function get_current_state()
    local state = {}
    for _, mem in pairs(MEMTRACK) do
        local addr = mem[1]
        local size = mem[2]

        if mem[1] < 0x10000 then
            addr = 0x7E0000 + addr
        end

        if size > 1 then
            assert(bit.band(size, 1) == 0)
            for i_addr = addr, addr + size - 1, 2 do
                state[i_addr] = {2, memory.readwordunsigned(i_addr)}
            end
        else
            if size == 1 then
                state[addr] = {1, memory.readbyte(addr)}
            else
                state[addr] = {2, memory.readwordunsigned(addr)}
            end
        end
    end
    return state
end

local function save_preset(step)
    local current_state = get_current_state()

    print("saving step " .. step['full_slug'])
    preset_output = preset_output .. "\npreset_" .. CAT .. '_' .. step['full_slug'] .. ":\n"

    if last_step then
        preset_output = preset_output .. "    dw #preset_" .. CAT .. '_' .. last_step['full_slug'] .. " ; " .. last_step['full_name'] .. "\n"
    else
        preset_output = preset_output .. "    dw #$0000\n"
    end

    last_step = step

    for addr, size_and_val in orderedPairs(current_state) do
        local size = size_and_val[1]
        local val = size_and_val[2]

        if last_state[addr] ~= val then
            last_state[addr] = val

            preset_output = preset_output ..  "    dl " ..  tohex(addr, 6) .. " : "
            preset_output = preset_output ..  "db " ..  tohex(size, 2) .. " : "
            preset_output = preset_output .. (size == 1 and "db " or "dw ") ..  tohex(val, size == 1 and 2 or 4)
            preset_output = preset_output .. " ; " .. annotate_address(addr, val) .. "\n"
        end
    end

    preset_output = preset_output .. "    dw #$FFFF\n"
    preset_output = preset_output .. ".after\n"
end

local function save_preset_file()
    local file = io.open('presets_data.asm', 'w')
    file:write(preset_output)
    file:close()

    local file = io.open('presets_menu.asm', 'w')

    file:write('PresetsMenu' .. ucfirst(CAT) .. ':\n')
    for _, segment in pairs(SEGMENTS[CAT]) do
        file:write('    dw #presets_goto_' .. CAT .. '_' .. segment['slug'] .. '\n')
    end
    file:write('    dw #$0000\n')
    file:write('    %cm_header("PRESETS FOR ' .. CAT:upper() .. '")\n')
    file:write('\n')

    for _, segment in pairs(SEGMENTS[CAT]) do
        file:write('presets_goto_' .. CAT .. '_' .. segment['slug'] .. ':\n')
        file:write('    %cm_submenu("' .. segment['name'] .. '", #presets_submenu_' .. CAT .. '_' .. segment['slug'] .. ')\n')
        file:write('\n')
    end

    for _, segment in pairs(SEGMENTS[CAT]) do
        file:write('presets_submenu_' .. CAT .. '_' .. segment['slug'] .. ':\n')
        for _, step in pairs(segment['steps']) do
            file:write('    dw #presets_' .. CAT .. '_' .. step['full_slug'] .. '\n')
        end
        file:write('    dw #$0000\n')
        file:write('    %cm_header("' .. segment['name']:upper() .. '")\n')
        file:write('\n')
    end

    for _, segment in pairs(SEGMENTS[CAT]) do
        file:write('; ' .. segment['name'] .. '\n')
        for _, step in pairs(segment['steps']) do
            file:write('presets_' .. CAT .. '_' .. step['full_slug'] .. ':\n')
            file:write('    %cm_preset("' .. step['name'] .. '", #preset_' .. CAT .. '_' .. step['full_slug'] .. ')\n\n')
        end
        file:write("\n")
    end
    file:close()
end

--
-- Main
--

local function tick()
    local frame = emu.framecount()

    local step = STEPS[CAT][frame]
    if step then
        save_preset(step)
        save_preset_file()
    end
end

local function main()
    for _, segment in pairs(SEGMENTS[CAT]) do
        segment['slug'] = slugify(segment['name'])
    end

    for _, step in orderedPairs(STEPS[CAT]) do
        segment = SEGMENTS[CAT][step['segment_no']]
        step['segment'] = segment
        step['slug'] = slugify(step['name'])
        step['full_slug'] = segment['slug'] .. "_" .. step['slug']
        step['full_name'] = segment['name'] .. ": " .. step['name']
        table.insert(segment['steps'], step)
    end

    while true do
        tick()
        snes9x.frameadvance()
    end
end

main()
