#reset all command blocks
data modify block ~ ~3 ~ powered set value 0
data modify block ~-1 ~3 ~ powered set value 0
data modify block ~ ~4 ~ powered set value 0
data modify block ~-1 ~4 ~ powered set value 0
data modify block ~ ~5 ~ powered set value 0
data modify block ~-1 ~5 ~ powered set value 0
data modify block ~ ~6 ~ powered set value 0
data modify block ~-1 ~6 ~ powered set value 0
#data modify block ~ ~7 ~ powered set value 0
#data modify block ~-1 ~7 ~ powered set value 0
#data modify block ~ ~8 ~ powered set value 0
#data modify block ~-1 ~8 ~ powered set value 0
#data modify block ~ ~9 ~ powered set value 0
#data modify block ~-1 ~9 ~ powered set value 0
#data modify block ~ ~10 ~ powered set value 0
#data modify block ~-1 ~10 ~ powered set value 0
#data modify block ~-1 ~11 ~ powered set value 0
#data modify block ~ ~11 ~ powered set value 0

execute if score $debug concat matches 1 run scoreboard players set $debug concat 0