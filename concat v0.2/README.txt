CONCAT Java 1.20 v1.1
WARNING YOU CAN ONLY USE CONCAT ONCE PER TICK. Attempt to do otherwise will just override any previous changes to inputs
HOW TO USE
----------

Rundown/Summary

    All inputs are found in the scoreboard concat and the nbt storage concat:ui. Output is concat:ui output. Activate with /scoreboard players set $listening concat 1

Step 1 - select input method

    Set the score for player $inputMode in the concat scoreboard to your desired input method (0 is default and takes two traditional strings).
    Some of these are redundent beacuse you can use empty strings. This is done so you can still create and run custom commands in a single tick without
    needing to use concat more than once in that tick.(YOU CAN ONLY USE CONCAT ONCE PER TICK)

        Key
        there are 5 string inputs and 9 scoreboard inputs.
        (string 1) = /data modify storage concat:ui string1 set value "Example"
        (string 4) = /data modify storage concat:ui string4 set value "Example 2"
        (sb1) = /scoreboard players set $input1 concat 123
        (sb9) = /scoreboard players set $input9 concat -321
        (" ") = a space is automatically added here
        Note: default placment mode is "replace normal". Must add for mode 9 and 10 because a blank string leaves an extra space at the end of the output.

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

Step 2 - Split event order before and after concatenation

    Sadly, this must use command blocks to run. This means anything you need to do after the concat operation must be executed by the machine itself.
    This means you should separate any post-concat operations you need done into a new function and then tell the machine where to find it. This is done by changing the score of $pointerReset
    in the concat scoreboard to 0 (recommended) or 1. 0 uses the provided "concat:done" function and 1 runs a command (probably a function command) in the input nbt concat:ui custom_command.
    You can additionally immediately run the concatenated output by changing the score of $runCommand in concat to 1. See config to adjust these values

Step 3 - Activate

    Change the score of $listening in the concat scoreboard to 1 and the datapack will use the needed inputs you gave in the concat:ui nbt storage and the concat scoreboard inputs. The output will
    also be in the same nbt storage under the path "output". You can only change the score once per tick

Your Done!

----------
How it works

    The data pack creates a machine in a small custom dimension called clipboard. When on, it will constantly load the 0 0 chunk in that dimension in preparation for input. 
    The concatenation occurs by first converting the string to a JSON string. This is done by modifying a sign to the storage and scoreboard values in the correct order. Next, that JSON is put onto
    an armor_stand's custom name so it can be retrieved by enchanting that armor stand. The result is an error that contains the name of our armor stand with the concatenated string as its name. 
    Because this requires a command block to run, we insert them at the end of the command block chain as its running. 
    Because we insert them in before the initial pulse is completed, the operation can be completed within a single tick. Finally, run any functions given by the user and 
    reset the machine before the tick ends.

----------
CREDITS
    Minecraft - Hero_Steven
    reddit - u/Duckwizard_76
Special Thanks
    HUGE thanks to discord user "the der discohund#8028" for an example datapack. I could not have done any of this without his exexplanations on the Cloud Wolf Discord server. Seriously, this guy did lots of the work.
        Convo here https://discord.com/channels/172543159769890816/172543159769890816/1065489454548127767
    Big thanks to McTsts and his contributors for pioneering string work 
        Here https://github.com/McTsts/Minecraft-String-Utilities#credit
----------
Other
    If you find bugs or have recommendations for improvement, please contact me as this is one of my first datapacks and my first public one at that. Also, mind any spelling im stupit (:

    example commands for dynamic give command (can be run in any order)
        data modify storage concat:ui string2 set value "minecraft:diamond"
        data modify storage concat:ui string1 set value "give @p "
        scoreboard players set $inputMode concat 6
        scoreboard players set $input1 concat 1
        scoreboard players set $runCommand concat 1
        scoreboard players set $listening concat 1

    Functions that may be important to you
        concat:uninstall - run this to remove machine and unload chunk
        concat:config - open this to change default values
        concat:done - put stuff in here for 0-tick operations
        concat:init - run this to reset all inputs and reset the machine.
