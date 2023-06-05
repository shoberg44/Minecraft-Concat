gamerule commandBlockOutput false
##########################################################
scoreboard players set $inputMode concat 0
#changes parameter fields (sb 1-9 = scoreboard $input*1-9*)
#WARNING you can only run the concat function one time per tick. So make sure you choose the correct input mode to make it count.

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
##########################################################
scoreboard players set $listening concat 0
#trigger. Setting to 1 will make it concat the next tick after which it will reset back to 0
##########################################################
scoreboard players set $pointerReset concat 0
#Changes between default and string defined post-concat operations.
#Any commands you want done after the concat is done in the same tick.
#Ether option is run after the $runCommand option is executed (if selected)

#0 
    #Runs the function "concat:done"
    #The done function runs as a command block in the machine at 0 0 0 in the overworld (execute in minecraft:overworld positioned 0 0 0 run function concat:done)

#1 
    
    #Will execute at a command block in the machine whatever you input into the nbt custom_command in concat:ui storage.
    #(/data modify storage concat:ui custom_command set value "tellraw @p \"This is an example\"")
    #Remeber to use exit characters for quotes (" = \")
    #Its possible to accidentally damage the machine with this method if you modify any of the blocks at or surrounding the point this command will execute from (A command block from the machine). This is why its not recommended. But you can always reload the datapack.

##########################################################
scoreboard players set $runCommand concat 0
#runs the concatinated string result in a command block when true.
#This is run right before the done function/custom_command is run.
##########################################################
scoreboard players set $nextTickOverride concat 1
#the machine will run # times, every time is an additional tick and each tick it will deacrease by 1 right before player commands or functions are run. Best for when you need multible concat operations back to back.
#manualy changing the listening score in the done function or custom_comand will not effect $nextTickOverride but will essentally do the same thing.

#You can use this so its easier to track which concat operation is which.

#This means the score will show 1 ... or <1 if thats what it was set to before.
#Changing $nextTickOverride between ticks will effect how many times the machine will run.
##########################################################
