#gets the length of int ie 1 is 1, 143 is 3, 10 is 2
#DOES NOT ADJUST FOR NEGITIVE INTS
#seems inefficent, if you can improve please do

execute if score $%intlength% concat matches -9..9 run return 1
execute if score $%intlength% concat matches -99..99 run return 2
execute if score $%intlength% concat matches -999..999 run return 3
execute if score $%intlength% concat matches -9999..9999 run return 4
execute if score $%intlength% concat matches -99999..99999 run return 5
execute if score $%intlength% concat matches -999999..999999 run return 6
execute if score $%intlength% concat matches -9999999..9999999 run return 7
execute if score $%intlength% concat matches -99999999..99999999 run return 8
execute if score $%intlength% concat matches -999999999..999999999 run return 9
execute if score $%intlength% concat matches -2147483647..2147483647 run return 10