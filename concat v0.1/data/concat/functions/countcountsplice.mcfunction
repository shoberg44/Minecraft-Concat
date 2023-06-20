#store countsplice before overide
data modify storage concat:generic countsplice set string block ~ ~5 ~ LastOutput 91
#storage to sign
data modify block ~ ~ ~ front_text.messages[2] set value '[{"text":"data modify block ~ ~1 ~ Command set string storage concat:generic countsplice 0 "},{"score":{"name":"$countlength","objective":"concat"}}]'
#sign to stand
data modify entity @s CustomName set from block ~ ~ ~ front_text.messages[2]