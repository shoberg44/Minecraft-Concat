#gives you diamonds based on your elevation
data modify storage concat:ui string2 set value "minecraft:diamond"
data modify storage concat:ui string1 set value "give @p "
scoreboard players set $inputMode concat 9
execute store result score $input1 concat run data get entity @p Pos[1]
scoreboard players set $runCommand concat 1
scoreboard players set $listening concat 1