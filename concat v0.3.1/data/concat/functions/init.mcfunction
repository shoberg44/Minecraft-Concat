scoreboard objectives add concat dummy
function concat:config
execute in concat:clipboard run forceload add 0 0
execute in concat:clipboard positioned 0 0 0 run kill @e[type=armor_stand,sort=nearest,tag=flattener,distance=..5]
execute in concat:clipboard run place template concat:tower -1 0 0
data merge storage concat:ui {string1:"",string2:"",string3:"",string4:"",string5:"",output:"OUTPUT",custom_command:""}

#score inputs
scoreboard players set $input1 concat 0
scoreboard players set $input2 concat 0
scoreboard players set $input3 concat 0
scoreboard players set $input4 concat 0
scoreboard players set $input5 concat 0
scoreboard players set $input6 concat 0
scoreboard players set $input7 concat 0
scoreboard players set $input8 concat 0
scoreboard players set $input9 concat 0

#other
scoreboard players set $debug concat 0