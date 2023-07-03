#concat 2/3
execute if score $listening concat matches 2 run data modify storage concat:ui string1 set from storage concat:ui output
execute if score $listening concat matches 2 run data modify storage concat:ui string2 set value " "
execute if score $listening concat matches 2 run scoreboard players set $inputMode concat 0
#0 = two string inputs (string1)(string2)

#concat 3/3
execute if score $listening concat matches 1 run data modify storage concat:ui string1 set from storage concat:ui output
execute if score $listening concat matches 1 run data modify storage concat:ui string2 set string entity @p SelectedItem.id 10
execute if score $listening concat matches 1 run data modify storage concat:ui string3 set value "s!"
execute if score $listening concat matches 1 run scoreboard players set $inputMode concat 1
#1 = three string inputs (string1)(string2)(string3)

#concat done!
execute if score $listening concat matches 0 run tellraw @p [{"nbt":"output","storage":"concat:ui","color":"gold","bold":true}]

execute if score $listening concat matches 0 run function concat:init