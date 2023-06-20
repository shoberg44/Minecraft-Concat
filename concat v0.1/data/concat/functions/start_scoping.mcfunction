data modify block ~ ~2 ~ powered set value 1
data modify block ~ ~3 ~ powered set value 1
data modify block ~ ~4 ~ powered set value 1
data modify block ~ ~5 ~ powered set value 1
data modify block ~ ~6 ~ powered set value 1
data modify block ~ ~7 ~ powered set value 1
data modify block ~ ~8 ~ powered set value 1
data modify block ~ ~9 ~ powered set value 1
data modify block ~ ~10 ~ powered set value 1
data modify block ~ ~11 ~ powered set value 1
data modify block ~ ~12 ~ powered set value 1
data modify block ~ ~13 ~ powered set value 1
data modify block ~ ~14 ~ powered set value 1

#runs twice without scoreboard checks here, don't know why
execute in concat:clipboard as @e[type=marker,limit=1,sort=nearest,tag=chunk_manager] at @s run function concat:start