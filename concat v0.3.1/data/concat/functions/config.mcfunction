gamerule commandBlockOutput false
##########################################################
scoreboard players set $inputMode concat 0
#changes parameter fields (sb 1-9 = scoreboard $input*1-9*)
#WARNING you can only run the concat function one time per tick. So make sure you choose the correct input mode to make it count.

#0 = two string inputs (string1)(string2)
#1 = three string inputs (string1)(string2)(string3)
#2 = four string inputs (string1)(string2)(string3)(string4)
#3 = five string inputs (string1)(string2)(string3)(string4)(string5)

#4 = (sb1)(string1)
#5 = (sb1)(" ")(string1)
#6 = (string1)(sb1)
#7 = (string1)(" ")(sb1)
#8 = (string1)(" ")(sb1)(" ")(string2)

#9 ~ give = (string1)(string2)(" ")(sb1)
#10 ~ setblock = (string1)(" ")(sb1)(" ")(sb2)(" ")(sb3)(" ")(string2)(string3)
#11 ~ fill = (string1)(" ")(sb1)(" ")(sb2)(" ")(sb3)(" ")(sb4)(" ")(sb5)(" ")(sb6)(" ")(string2)(string3)
#12 ~ clone 1 = (string1)(" ")(sb1)(" ")(sb2)(" ")(sb3)(" ")(sb4)(" ")(sb5)(" ")(sb6)(" ")(sb7)(" ")(sb8)(" ")(sb9)(" ")(string2)
#13 ~ clone 2 = (string1)(string2)(" ")(sb1)(" ")(sb2)(" ")(sb3)(" ")(sb4)(" ")(sb5)(" ")(sb6)(" ")(string3)(" ")(sb7)(" ")(sb8)(" ")(sb9)(" ")(string4)
##########################################################
scoreboard players set $listening concat 0
#triggers the machine to run and reduce this score when above zero. When set to 3 it will run 3 times. The score is reduced before user provided commands are run (it will be zero while the custom_command or done function is run)
##########################################################
scoreboard players set $pointerReset concat 0
#Changes between default and string defined post-concat operations.
#Any commands you want done after the concat is done in the same tick.
#Ether option is run after the $runCommand option is executed (if selected)
#the function concat:done2 runs no matter what and is not effected by this

#0 
    #Runs the function "concat:done"
    #The done function runs as a command block in the machine at 0 0 0 in the overworld (execute in minecraft:overworld positioned 0 0 0 run function concat:done)

#1 
    
    #Will execute at a command block in the machine whatever you input into the nbt custom_command in concat:ui storage.
    #(/data modify storage concat:ui custom_command set value "tellraw @p \"This is an example\"")
    #Remeber to use exit characters for quotes (" = \")
    # !!!!NOTICE!!!!! -> Its possible to accidentally damage the machine with this method if you modify any of the blocks at or surrounding the point this command will execute from (A command block from the machine). This is why its not recommended. But you can always reload the datapack.

##########################################################
scoreboard players set $runCommand concat 0
#runs the concatinated string result in a command block when true.
#This is run right before the done function/custom_command is run.
##########################################################
scoreboard players set $async concat 0
#runs all of the concat within a single tick when 0
#when 1, each concat is seperated between ticks.
##########################################################
scoreboard players set $debug concat 0
#1 will do a basic chat output on the next run. 2 will do the same but it will not shut off after a single run and needs to be manually shut off. 3 will do the same as 2 but with extra info listed below.
        #Debug: # ~ this ^
        #Listening: # ~ current listening value of that concat operation. Deacreases evertime a concat happens. 0 means its the last one for that tick.
        #ASync: # ~ decides if the machine will try and run everything in one tick or seperate each operation into its own tick.
        #Input Mode: # ~ Input mode from config
##########################################################