#first collapse of three
data modify storage concat:generic countcountsplice set string block ~ ~7 ~ LastOutput 91

#splice of count (describes count digets so always one diget more is needed becsause max is 9) (starts reaction)
execute if score $precountcount concat matches 1..9 run data modify block ~ ~9 ~ Command set string storage concat:generic countcountsplice 0 83
execute if score $precountcount concat matches 10 run data modify block ~ ~9 ~ Command set string storage concat:generic countcountsplice 0 84

#reset active score
scoreboard players set $listening concat 0