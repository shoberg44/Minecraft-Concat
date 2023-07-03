scoreboard players set $input1 concat 1
scoreboard players set $input2 concat -2
scoreboard players set $input3 concat 3
scoreboard players set $input4 concat -4
scoreboard players set $input5 concat 5
scoreboard players set $input6 concat -6
scoreboard players set $input7 concat 7
scoreboard players set $input8 concat -8
scoreboard players set $input9 concat 9
data modify storage concat:ui string1 set value "ab"
data modify storage concat:ui string2 set value "bc"
data modify storage concat:ui string3 set value "cd"
data modify storage concat:ui string4 set value "de"
data modify storage concat:ui string5 set value "ef"


#config options
scoreboard players set $listening concat 0
scoreboard players set $inputMode concat 0
scoreboard players set $runCommand concat 0
scoreboard players set $pointerReset concat 0
data modify storage concat:ui custom_command set value "say \"custom_command activated!\""
