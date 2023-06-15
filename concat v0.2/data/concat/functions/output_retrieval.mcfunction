#collapse
data modify storage concat:ui output set string block ~ ~3 ~ LastOutput 91 -38

#update count score
execute if score $nextTickOverride concat matches 2.. run scoreboard players remove $nextTickOverride concat 1