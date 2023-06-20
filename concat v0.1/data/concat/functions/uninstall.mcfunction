scoreboard objectives remove concat
execute at @e[type=armor_stand,limit=1,sort=nearest,tag=flattener] run fill ~ ~ ~ ~ ~14 ~ air
kill @e[type=armor_stand,limit=1,sort=nearest,tag=flattener]
execute in concat:clipboard positioned 0 0 0 run kill @e[type=marker,limit=1,sort=nearest,tag=chunk_manager]
execute in concat:clipboard run forceload remove 0 0