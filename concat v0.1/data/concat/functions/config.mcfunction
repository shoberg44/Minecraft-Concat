gamerule commandBlockOutput false
##########################################################
scoreboard players set $inputMode concat 0
#changes parameter fields (sb 1-9 = scoreboard $input*1-9*)
#WARNING you can only run the concat function one time per tick. So make sure you choose the correct input mode to make it count.

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
##########################################################
scoreboard players set $listening concat 0
#trigger. Setting to 1 will make it concat the next tick after which it will reset back to 0
##########################################################
scoreboard players set $pointerReset concat 0
#changes between default and string defined postconcat functions

#0 
    #write any commands you want done in the same tick after the concat is done in the "done" function.
    #The done function runs as a command block in the machine at 0 0 0 in the overworld (execute in minecraft:overworld positioned 0 0 0 run function concat:done)

#1 
    #input the command you want to be run after concat before next tick. Input into nbt custom_command in concat:ui storage.
    #(/data modify storage concat:ui custom_command set value "tellraw @p \"This is an example\"")
    #Remeber to use exit characters for quotes (" = \")

##########################################################
scoreboard players set $runCommand concat 0
#runs string result after concat in a command block when true
##########################################################
