# left shift
li $s0, 9 
sll  $t2, $s0, 4

#AND 
li $t2, 0xdc0 
li $t1, 0x3c00
and $t4, $t1, $t2

#or
or $t5, $t1, $t2

#nor
li $t3, 0
nor $t6, $t1, $t3