scoreboard players set $runCommand concat 0
scoreboard players set $listening concat 3
scoreboard players set $pointerReset concat 1
data modify storage concat:ui custom_command set value "function concat:tests/holding_test/holding_0-tick"

#concat 1/3
data modify storage concat:ui string1 set value "I am currently holding"
execute store result score $input1 concat run data get entity @p SelectedItem.Count
scoreboard players set $inputMode concat 7
#7 = (string1)(" ")(sb1)