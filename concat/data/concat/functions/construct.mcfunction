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
execute in concat:clipboard positioned 0 0 0 run function concat:start
#sign->stand->block->storage
#storage to sign
execute if score $nextTickOverride concat matches ..1 run scoreboard players set $listening concat 0

execute if score $inputMode concat matches 0 run data modify block ~ ~ ~ front_text.messages[0] set value '[{"nbt":"string1","storage":"concat:ui"},{"nbt":"string2","storage":"concat:ui"}]'
execute if score $inputMode concat matches 1 run data modify block ~ ~ ~ front_text.messages[0] set value '[{"nbt":"string1","storage":"concat:ui"},{"nbt":"string2","storage":"concat:ui"},{"nbt":"string3","storage":"concat:ui"}]'
execute if score $inputMode concat matches 2 run data modify block ~ ~ ~ front_text.messages[0] set value '[{"nbt":"string1","storage":"concat:ui"},{"nbt":"string2","storage":"concat:ui"},{"nbt":"string3","storage":"concat:ui"},{"nbt":"string4","storage":"concat:ui"}]'
execute if score $inputMode concat matches 3 run data modify block ~ ~ ~ front_text.messages[0] set value '[{"nbt":"string1","storage":"concat:ui"},{"nbt":"string2","storage":"concat:ui"},{"nbt":"string3","storage":"concat:ui"},{"nbt":"string4","storage":"concat:ui"},{"nbt":"string5","storage":"concat:ui"}]'

execute if score $inputMode concat matches 4 run data modify block ~ ~ ~ front_text.messages[0] set value '[{"nbt":"string1","storage":"concat:ui"},{"text":" "},{"score":{"name":"$input1","objective":"concat"}}]'
execute if score $inputMode concat matches 5 run data modify block ~ ~ ~ front_text.messages[0] set value '[{"nbt":"string1","storage":"concat:ui"},{"text":" "},{"score":{"name":"$input1","objective":"concat"}},{"text":" "},{"nbt":"string2","storage":"concat:ui"}]'

execute if score $inputMode concat matches 6 run data modify block ~ ~ ~ front_text.messages[0] set value '[{"nbt":"string1","storage":"concat:ui"},{"nbt":"string2","storage":"concat:ui"},{"text":" "},{"score":{"name":"$input1","objective":"concat"}}]'
execute if score $inputMode concat matches 7 run data modify block ~ ~ ~ front_text.messages[0] set value '[{"nbt":"string1","storage":"concat:ui"},{"text":" "},{"score":{"name":"$input1","objective":"concat"}},{"text":" "},{"score":{"name":"$input2","objective":"concat"}},{"text":" "},{"score":{"name":"$input3","objective":"concat"}},{"text":" "},{"nbt":"string2","storage":"concat:ui"},{"nbt":"string3","storage":"concat:ui"}]'
execute if score $inputMode concat matches 8 run data modify block ~ ~ ~ front_text.messages[0] set value '[{"nbt":"string1","storage":"concat:ui"},{"text":" "},{"score":{"name":"$input1","objective":"concat"}},{"text":" "},{"score":{"name":"$input2","objective":"concat"}},{"text":" "},{"score":{"name":"$input3","objective":"concat"}},{"text":" "},{"score":{"name":"$input4","objective":"concat"}},{"text":" "},{"score":{"name":"$input5","objective":"concat"}},{"text":" "},{"score":{"name":"$input6","objective":"concat"}},{"text":" "},{"nbt":"string2","storage":"concat:ui"},{"nbt":"string3","storage":"concat:ui"}]'
execute if score $inputMode concat matches 9 run data modify block ~ ~ ~ front_text.messages[0] set value '[{"nbt":"string1","storage":"concat:ui"},{"text":" "},{"score":{"name":"$input1","objective":"concat"}},{"text":" "},{"score":{"name":"$input2","objective":"concat"}},{"text":" "},{"score":{"name":"$input3","objective":"concat"}},{"text":" "},{"score":{"name":"$input4","objective":"concat"}},{"text":" "},{"score":{"name":"$input5","objective":"concat"}},{"text":" "},{"score":{"name":"$input6","objective":"concat"}},{"text":" "},{"score":{"name":"$input7","objective":"concat"}},{"text":" "},{"score":{"name":"$input8","objective":"concat"}},{"text":" "},{"score":{"name":"$input9","objective":"concat"}},{"text":" "},{"nbt":"string2","storage":"concat:ui"}]'
execute if score $inputMode concat matches 10.. run data modify block ~ ~ ~ front_text.messages[0] set value '[{"nbt":"string1","storage":"concat:ui"},{"nbt":"string2","storage":"concat:ui"},{"text":" "},{"score":{"name":"$input1","objective":"concat"}},{"text":" "},{"score":{"name":"$input2","objective":"concat"}},{"text":" "},{"score":{"name":"$input3","objective":"concat"}},{"text":" "},{"score":{"name":"$input4","objective":"concat"}},{"text":" "},{"score":{"name":"$input5","objective":"concat"}},{"text":" "},{"score":{"name":"$input6","objective":"concat"}},{"text":" "},{"nbt":"string3","storage":"concat:ui"},{"text":" "},{"score":{"name":"$input7","objective":"concat"}},{"text":" "},{"score":{"name":"$input8","objective":"concat"}},{"text":" "},{"score":{"name":"$input9","objective":"concat"}},{"text":" "},{"nbt":"string4","storage":"concat:ui"}]'

#to stand before 1st enchant
data modify entity @s CustomName set from block ~ ~ ~ front_text.messages[0]



#0 = two string inputs (string1)(string2)
#1 = three string inputs (string1)(string2)(string3)
#2 = four string inputs (string1)(string2)(string3)(string4)
#3 = five string inputs (string1)(string2)(string3)(string4)(string5)

#4 = (string1)(" ")(sb1)
#5 = (string1)(" ")(sb1)(" ")(string2)

#6 ~ give = (string1)(string2)(" ")(sb1)
#7 ~ setblock = (string1)(" ")(sb1)(" ")(sb2)(" ")(sb3)(" ")(string2)(string3)
#8 ~ fill = (string1)(" ")(sb1)(" ")(sb2)(" ")(sb3)(" ")(sb4)(" ")(sb5)(" ")(sb6)(" ")(string2)(string3)
#9 ~ clone 1 = (string1)(" ")(sb1)(" ")(sb2)(" ")(sb3)(" ")(sb4)(" ")(sb5)(" ")(sb6)(" ")(sb7)(" ")(sb8)(" ")(sb9)(" ")(string2)
#10 ~ clone 2 = (string1)(string2)(" ")(sb1)(" ")(sb2)(" ")(sb3)(" ")(sb4)(" ")(sb5)(" ")(sb6)(" ")(string3)(" ")(sb7)(" ")(sb8)(" ")(sb9)(" ")(string4)
