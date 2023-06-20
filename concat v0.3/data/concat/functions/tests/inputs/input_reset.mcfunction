scoreboard players reset * concat
scoreboard players set $input1 concat 0
scoreboard players set $input2 concat 0
scoreboard players set $input3 concat 0
scoreboard players set $input4 concat 0
scoreboard players set $input5 concat 0
scoreboard players set $input6 concat 0
scoreboard players set $input7 concat 0
scoreboard players set $input8 concat 0
scoreboard players set $input9 concat 0
data modify storage concat:ui string1 set value ""
data modify storage concat:ui string2 set value ""
data modify storage concat:ui string3 set value ""
data modify storage concat:ui string4 set value ""
data modify storage concat:ui string5 set value ""

#config options
scoreboard players set $listening concat 0
scoreboard players set $inputMode concat 0
scoreboard players set $runCommand concat 0
scoreboard players set $pointerReset concat 0
data modify storage concat:ui custom_command set value ""
scoreboard players set $debug concat 0
scoreboard players set $async concat 0