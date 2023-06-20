scoreboard objectives remove concat
execute at @e[type=armor_stand,limit=1,sort=nearest,tag=flattener] run fill ~ ~ ~ ~-1 ~6 ~ air
kill @e[type=armor_stand,limit=1,sort=nearest,tag=flattener]
execute in concat:clipboard run forceload remove 0 0