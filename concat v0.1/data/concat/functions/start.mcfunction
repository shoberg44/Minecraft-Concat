# scoreboard values
# $substring is temp for counting

#constants
#front end junk - 91 char
#back end junk - 31 char
#countcount to count splice constant - 86 char

#reset counter
scoreboard players set $stringtotal concat 0

#adds string length
#only add to total if its needed in the inputMode
execute store result score $substring concat run data get storage concat:ui string1
scoreboard players operation $stringtotal concat += $substring concat

execute store result score $substring concat run data get storage concat:ui string2
execute unless score $inputMode concat matches 4 run scoreboard players operation $stringtotal concat += $substring concat

execute store result score $substring concat run data get storage concat:ui string3
execute if score $inputMode concat matches 1..3 run scoreboard players operation $stringtotal concat += $substring concat
execute if score $inputMode concat matches 8 run scoreboard players operation $stringtotal concat += $substring concat
execute if score $inputMode concat matches 10 run scoreboard players operation $stringtotal concat += $substring concat

execute store result score $substring concat run data get storage concat:ui string4
execute if score $inputMode concat matches 2..3 run scoreboard players operation $stringtotal concat += $substring concat
execute if score $inputMode concat matches 8 run scoreboard players operation $stringtotal concat += $substring concat
execute if score $inputMode concat matches 10 run scoreboard players operation $stringtotal concat += $substring concat

execute store result score $substring concat run data get storage concat:ui string5
execute if score $inputMode concat matches 3 run scoreboard players operation $stringtotal concat += $substring concat
#tellraw @p [{"text":"DEBUG SCORE: "},{"score":{"name":"$substring","objective":"concat"},"color":"gold","bold":true}]

#add score length (using intlength func)
#4-6 1 score
#sets parameter
execute if score $inputMode concat matches 4.. run scoreboard players operation $%intlength% concat = $input1 concat
#runs function
execute if score $inputMode concat matches 4.. store result score $substring concat run function concat:intlength
#adds for space and -
execute if score $inputMode concat matches 4.. if score $input1 concat matches ..-1 run scoreboard players add $substring concat 1
execute if score $inputMode concat matches 4.. run scoreboard players add $substring concat 1
execute if score $inputMode concat matches 4.. run scoreboard players operation $stringtotal concat += $substring concat
#-----------------------
#7 3 score
#sets parameter
execute if score $inputMode concat matches 7.. run scoreboard players operation $%intlength% concat = $input2 concat
execute if score $inputMode concat matches 7.. store result score $substring concat run function concat:intlength
#adds for -
execute if score $inputMode concat matches 7.. if score $input2 concat matches ..-1 run scoreboard players add $substring concat 1
execute if score $inputMode concat matches 7.. run scoreboard players operation $stringtotal concat += $substring concat
#sets parameter
execute if score $inputMode concat matches 7.. run scoreboard players operation $%intlength% concat = $input3 concat
execute if score $inputMode concat matches 7.. store result score $substring concat run function concat:intlength
#adds for space and -
execute if score $inputMode concat matches 7.. if score $input3 concat matches ..-1 run scoreboard players add $substring concat 1
#adds spaces
execute if score $inputMode concat matches 7.. run scoreboard players add $substring concat 2
execute if score $inputMode concat matches 7.. run scoreboard players operation $stringtotal concat += $substring concat
#-----------------------
#8 6 score
#sets parameter
execute if score $inputMode concat matches 8.. run scoreboard players operation $%intlength% concat = $input4 concat
execute if score $inputMode concat matches 8.. store result score $substring concat run function concat:intlength
#adds for -
execute if score $inputMode concat matches 8.. if score $input4 concat matches ..-1 run scoreboard players add $substring concat 1
execute if score $inputMode concat matches 8.. run scoreboard players operation $stringtotal concat += $substring concat
#sets parameter
execute if score $inputMode concat matches 8.. run scoreboard players operation $%intlength% concat = $input5 concat
execute if score $inputMode concat matches 8.. store result score $substring concat run function concat:intlength
#adds for -
execute if score $inputMode concat matches 8.. if score $input5 concat matches ..-1 run scoreboard players add $substring concat 1
execute if score $inputMode concat matches 8.. run scoreboard players operation $stringtotal concat += $substring concat
#sets parameter
execute if score $inputMode concat matches 8.. run scoreboard players operation $%intlength% concat = $input6 concat
execute if score $inputMode concat matches 8.. store result score $substring concat run function concat:intlength
#adds for space and -
execute if score $inputMode concat matches 8.. if score $input6 concat matches ..-1 run scoreboard players add $substring concat 1
#adds spaces
execute if score $inputMode concat matches 8.. run scoreboard players add $substring concat 3
execute if score $inputMode concat matches 8.. run scoreboard players operation $stringtotal concat += $substring concat
#-----------------------
#9+ 9 score
#sets parameter
execute if score $inputMode concat matches 9.. run scoreboard players operation $%intlength% concat = $input7 concat
execute if score $inputMode concat matches 9.. store result score $substring concat run function concat:intlength
#adds for -
execute if score $inputMode concat matches 9.. if score $input7 concat matches ..-1 run scoreboard players add $substring concat 1
execute if score $inputMode concat matches 9.. run scoreboard players operation $stringtotal concat += $substring concat
#sets parameter
execute if score $inputMode concat matches 9.. run scoreboard players operation $%intlength% concat = $input8 concat
execute if score $inputMode concat matches 9.. store result score $substring concat run function concat:intlength
#adds for -
execute if score $inputMode concat matches 9.. if score $input8 concat matches ..-1 run scoreboard players add $substring concat 1
execute if score $inputMode concat matches 9.. run scoreboard players operation $stringtotal concat += $substring concat
#sets parameter
execute if score $inputMode concat matches 9.. run scoreboard players operation $%intlength% concat = $input9 concat
execute if score $inputMode concat matches 9.. store result score $substring concat run function concat:intlength
#adds for space and -
execute if score $inputMode concat matches 9.. if score $input9 concat matches ..-1 run scoreboard players add $substring concat 1
#adds spaces
execute if score $inputMode concat matches 9.. run scoreboard players add $substring concat 3
execute if score $inputMode concat matches 9.. run scoreboard players operation $stringtotal concat += $substring concat
#-----------------------
#gets length
scoreboard players operation $%intlength% concat = $stringtotal concat
execute store result score $countlength concat run function concat:intlength
scoreboard players operation $precountcount concat = $countlength concat
scoreboard players add $countlength concat 86

#0 = two string inputs (string1)(string2)
#1 = three string inputs (string1)(string2)(string3)
#2 = four string inputs (string1)(string2)(string3)(string4)
#3 = five string inputs (string1)(string2)(string3)(string4)(string5)

#4 = (string1)(sb1)
#5 = (string1)(sb1)(string2)

#6 ~ give = (string1)(string2)(sb1)
#7 ~ setblock = (string1)(sb1)(sb2)(sb3)(string2) 
#8 ~ fill = (string1)(string2)(sb1)(sb2)(sb3)(sb4)(sb5)(sb6)(string3)(string4)
#9 ~ clone 1 = (string1)(sb1)(sb2)(sb3)(sb4)(sb5)(sb6)(sb7)(sb8)(sb9)(string2)
#10 ~ clone 2 = (string1)(string2)(sb1)(sb2)(sb3)(sb4)(sb5)(sb6)(string3)(sb7)(sb8)(sb9)(string4)