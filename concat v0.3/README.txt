CONCAT Java 1.20 v0.3
HOW TO USE
----------

Rundown/Summary

    All inputs are found in the scoreboard concat and the nbt storage concat:ui. Output is concat:ui output. Activate with /scoreboard players set $listening concat 1

Step 1 - Select input method

    Set the score for player $inputMode in the concat scoreboard to your desired input method (0 is default and takes two traditional strings).
        Some of these are redundent beacuse you can use empty strings.
    
    This step is done to let you get your desired output in as few steps as possible.

        Key
        there are 5 string inputs and 9 scoreboard inputs.
        (string 1) = /data modify storage concat:ui string1 set value "Example"
        (string 4) = /data modify storage concat:ui string4 set value "Example 2"
        (sb1) = /scoreboard players set $input1 concat 123
        (sb9) = /scoreboard players set $input9 concat -321
        (" ") = a space is automatically added here
        Note: default placment mode is "replace normal". Must add for modes 12 and 13 because a blank string leaves an extra space at the end of the output.

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

Step 2 - Split event order before and after concatenation

    Sadly, this must use command blocks to run. This means anything you need to do after the concat operation must be executed by the machine itself.
    This means you should separate any post-concat operations you need done into a new function and then tell the machine where to find it. This is done by changing the score of $pointerReset
    in the concat scoreboard to 0 (recommended) or 1. 0 uses the provided "concat:done" function and 1 runs a command (probably a function command) in the input nbt concat:ui custom_command.
    You can additionally immediately run the concatenated output by changing the score of $runCommand in concat to 1. See config to adjust these values.

Step 3 - Activate

    Change the score of $listening in the concat scoreboard to 1+ and the datapack will use the required inputs you gave in the concat:ui nbt storage and the concat scoreboard inputs. The output will
    also be in the same nbt storage under the path "output". To do multible concats per tick, you must change the listening score to how many concats you need (1 being one operation, 3 being three operations). Then adjust the
    inputs between each concat utilizing ether custom_command or concat:done function. You may also use the concat:progress function to do whatever right before the concat if needed for some reason.

Your Done!
    Retrieve the output from nbt. (/data get storage concat:ui output)

----------
How it works

    The data pack creates a machine in a small custom dimension called clipboard. When on, it will constantly load the 0 0 chunk in that dimension in preparation for input. 
    The concatenation occurs by first converting the string to a JSON string. This is done by modifying a sign to the storage and scoreboard values. Next, that JSON is put onto
    an armor_stand's custom name so it can be retrieved by enchanting that armor stand. The result is an error that contains the name of our armor stand with the concatenated string as its name in basic string form.
    We then get the output from the output. Finally, run any functions given by the user and reset the machine before the tick ends.

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

    Functions that may be important to you
        concat:uninstall - run this to unload chunk in concat:clipboard and remove the machine
        concat:init - run this to reset inputs and reset the machine.
        concat:tests/inputs/input_reset - run this to hard reset all inputs
        concat:tests/inputs/test_inputs - run this to set inputs to test values (see the DEBUG section)
        concat:tests/debug/debug_run - run this to set inputs to test values and then test all input modes. See the debug section for more info
        concat:config - open this to change default values
        concat:done - put stuff in here for 0-tick operations. This will not run and instead be replaced by custom_command if $pointerReset is 1. (more info in config)
        concat:progress - put stuff in here to run right before concat. This one will run regardless of $pointerReset score
----------
DEBUG, TESTS, AND EXAMPLES
    To test if the data pack is broken you can try running functions from the concat:tests folder.

    Examples (both operate on the nearest player)

    /function concat:tests/dyn_give ~ gives you diamonds based on your elevation this will test basic functionality and the function contains a good example on how to use this datapack.
    /function concat:tests/holding_test/holding_run ~ tells you what and how many items you have selected. Uses 3 concats so it can be good to test if multiple concats work.

    Utility

    /function concat:tests/inputs/input_reset ~ hard resets all input values to 0
    /function concat:tests/inputs/test_inputs ~ fills in all inputs with test values. (strings go ab, bc, etc. Numbers count up from 1, evens are neg. And the custom command says "custom_command activated!",  all configs listed are set to 0 [listening, inputMode, pointerReset, runCommand])

    Tests

    scoreboard players set $debug concat 1 ~ 1 will do a basic chat output on the next run. 2 will do the same but it will not shut off after a single run and needs to be manually shut off. 3 will do the same as 2 but with extra info listed below.
        Debug: # ~ this ^
        Listening: # ~ current listening value of that concat operation. Deacreases evertime a concat happens. 0 means its the last one for that tick.
        ASync: # ~ decides if the machine will try and run everything in one tick or seperate each operation into its own tick.
        Input Mode: # ~ Input mode from config

        Reading the chat output

        "Base Activated" - Everytime the machine activates in a new tick, the machine will output base activated. This means if async is on (1), it will read before every concat. If async is not on and it reads anywhere else but the top,
            It indicates the machine is active in more than one tick which is not intented without async on.
        "string1: "... - This is a line which relays key information for debugging. string1 and string2 show whatever string1 and 2 where at the time of that particular concat. The output is what was recived at the end of the concat.
            If string1 and string2 are blank, that indicates a problem inputting strings (probably resulting in a blank output). If the line is missing, that means the machine failed to finish or debug was not on.
            If the output consists of random characters such as brackets, quotations marks, or parenthesis . . . that means something is terribly wrong with the hard coded start and stop index. This most likely means a minecraft update happened idk. You can try and change it in concat:lastbeforeclean  
    /function concat:tests/debug/debug_run ~ outputs all input modes in chat with test values. Automatically turns debug to 1. It should read like the following (debug 3 will insert the extra info before each "string1: "... line)
        -\/-\/-\/-\/-\/-\/-\/-\/-\/-\/-\/-\/-\/-\/-\/-
        Base Activated
        string1: ab string2: bc | output: abbc
        string1: ab string2: bc | output: abbccd
        string1: ab string2: bc | output: abbccdde
        string1: ab string2: bc | output: abbccddeef
        string1: ab string2: bc | output: 1ab
        string1: ab string2: bc | output: 1 ab
        string1: ab string2: bc | output: ab1
        string1: ab string2: bc | output: ab 1
        string1: ab string2: bc | output: ab 1 bc
        string1: ab string2: bc | output: abbc 1
        string1: ab string2: bc | output: ab 1 -2 3 bccd
        string1: ab string2: bc | output: ab 1 -2 3 -4 5 -6 bccd
        string1: ab string2: bc | output: ab 1 -2 3 -4 5 -6 7 -8 9 bc
        string1: ab string2: bc | output: abbc 1 -2 3 -4 5 -6 cd 7 -8 9 de
        -/\-/\-/\-/\-/\-/\-/\-/\-/\-/\-/\-/\-/\-/\-/\-
        If the output is the same for each line (most likely abbc everytime), that means something went wrong in incrementing the inputMode counter (done by the custom_command input).


            
        
       
----------
