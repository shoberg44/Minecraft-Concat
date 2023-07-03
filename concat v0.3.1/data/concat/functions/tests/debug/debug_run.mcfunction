function concat:tests/inputs/test_inputs
scoreboard players set $listening concat 14
scoreboard players set $inputMode concat 0
scoreboard players set $runCommand concat 0
scoreboard players set $pointerReset concat 1
data modify storage concat:ui custom_command set value "execute positioned 0 0 0 positioned over world_surface run function concat:tests/debug/debug_iteration"
execute if score $debug concat matches 0 run scoreboard players set $debug concat 1