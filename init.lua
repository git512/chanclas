chanclas = {}
chanclas.limited = {}
minetest.register_tool('chanclas:chanclas',{
inventory_image = "chanclas.png",
description = "CHANCLAS (flip-flops)",
on_use = function(itemstack, player, pointed_thing)
        local name = player:get_player_name()
        if pointed_thing.type == "object" and pointed_thing.ref:is_player() and (not chanclas.limited[name]) then
            local hit_player = pointed_thing.ref
            local pos = hit_player:get_pos()

            

            -- Play smack sound
            minetest.sound_play("smackplus", {
                pos = pos,
                max_hear_distance = 10,
                gain = 0.3,
            })

            -- Append ice
            --stickpack.apply_tempskin(30, hit_player, "freeze.png")

            -- Freeze
            hit_player:set_physics_override({
                jump = 0,
                speed = 0,
                gravity = 0,
            })
			hit_player:set_hp(0)
			hit_player:set_hp(0)
            -- Remove limiter
            minetest.after(3, function(name, hit_player)
                chanclas.limited[name] = nil
                hit_player:set_physics_override({
                    jump = 1,
                    speed = 1,
                    gravity = 1,
                })
            end, name, hit_player)
        end
    end,





})