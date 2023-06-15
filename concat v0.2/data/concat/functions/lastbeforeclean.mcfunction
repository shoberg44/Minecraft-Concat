execute if score $runCommand concat matches 1 run data modify block ~ ~1 ~ Command set from storage concat:ui output
execute if score $runCommand concat matches 0 run data modify block ~ ~1 ~ Command set value "help me"
execute if score $pointerReset concat matches 1 run data modify block ~ ~2 ~ Command set from storage concat:ui custom_command
execute if score $pointerReset concat matches 0 run data modify block ~ ~2 ~ Command set value "execute in minecraft:overworld positioned 0 0 0 run function concat:done"