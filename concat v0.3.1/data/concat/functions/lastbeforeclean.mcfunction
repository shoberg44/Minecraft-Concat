#collapse with hard codded indexes
data modify storage concat:ui output set string block ~ ~-2 ~ LastOutput 91 -38

#trigger counter!!!!!!!!
#do NOT put in construct, safer in here in case iteration fails to progress listening which then causes infinite loop when async is off (0)
execute if score $listening concat matches 1.. run scoreboard players remove $listening concat 1

execute if score $debug concat matches 3 run function concat:tests/chat_console_read
execute if score $debug concat matches 1..3 run tellraw @p [{"text":"string1: ","color":"gray","italic":true},{"nbt":"string1","storage":"concat:ui","color":"red","bold":true},{"text":" string2: ","color":"gray","italic":true},{"nbt":"string2","storage":"concat:ui","color":"aqua","bold":true},{"text":" | ","color":"black","bold":true},{"text":"output: ","color":"dark_gray","italic":true,"underlined":true},{"nbt":"output","storage":"concat:ui","color":"green","bold":true,"underlined":true}]
execute if score $runCommand concat matches 1 run data modify block ~ ~1 ~ Command set from storage concat:ui output
execute if score $runCommand concat matches 0 run data modify block ~ ~1 ~ Command set value "help me"
execute if score $pointerReset concat matches 1 run data modify block ~-1 ~1 ~ Command set from storage concat:ui custom_command
execute if score $pointerReset concat matches 0 run data modify block ~-1 ~1 ~ Command set value "execute in minecraft:overworld positioned 0 0 0 run function concat:done"