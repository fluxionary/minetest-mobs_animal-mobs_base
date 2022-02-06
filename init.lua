local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)

mobs_animal = {
	S = minetest.get_translator("mobs_animal"),
	log = function(level, messagefmt, ...)
		minetest.log(level, ("[%s] %s"):format(modname, messagefmt:format(...)))
	end
}

dofile(modpath .. "/settings.lua")

dofile(modpath .. "/craftitems.lua")
dofile(modpath .. "/crafts.lua")
dofile(modpath .. "/aliases.lua")

-- Animals
--dofile(modpath .. "/mobs/bee.lua") -- KrupnoPavel
--dofile(modpath .. "/mobs/bunny.lua") -- ExeterDad
--dofile(modpath .. "/mobs/chicken.lua") -- JKmurray
dofile(modpath .. "/mobs/cow.lua") -- KrupnoPavel
--dofile(modpath .. "/mobs/kitten.lua") -- Jordach/BFD
--dofile(modpath .. "/mobs/panda.lua") -- AspireMint
--dofile(modpath .. "/mobs/penguin.lua") -- D00Med
--dofile(modpath .. "/mobs/rat.lua") -- PilzAdam
--dofile(modpath .. "/mobs/sheep.lua") -- PilzAdam
--dofile(modpath .. "/mobs/warthog.lua") -- KrupnoPavel
