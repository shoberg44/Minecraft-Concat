#say before middle enchant
#store 1st enchant before overide
data modify storage concat:generic stringsplice set string block ~ ~3 ~ LastOutput 91
#storage to sign
data modify block ~ ~ ~ front_text.messages[1] set value '[{"text":"data modify storage concat:ui output set string storage concat:generic stringsplice 0 "},{"score":{"name":"$stringtotal","objective":"concat"}}]'
#sign to stand
data modify entity @s CustomName set from block ~ ~ ~ front_text.messages[1]