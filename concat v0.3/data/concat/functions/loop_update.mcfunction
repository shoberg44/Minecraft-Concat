#if good to loop, loop
execute if score $listening concat matches 1.. if score $async concat matches 0 run data modify block ~1 ~-1 ~ UpdateLastExecution set value 0
#if end of all loop, end loop
execute if score $listening concat matches 0 run data modify block ~1 ~-1 ~ UpdateLastExecution set value 1
#if async 1, end loop
execute if score $async concat matches 1 run data modify block ~1 ~-1 ~ UpdateLastExecution set value 1
