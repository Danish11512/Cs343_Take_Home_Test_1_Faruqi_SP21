.data
f: .word 0
g: .word 50
h: .word 40
i: .word 30
j: .word 20

.text
lw $a0, g
lw $a1, h
lw $a2, i
lw $a3, j
lw $s0, f

main_myadd: 

# make room for 3 items
addi $sp, $sp, -12  
# save register $t1
sw $t1, 8($sp) 
# save register $t0 
sw $t0, 4($sp) 
# save register $s0
sw $s0, 0($sp)

# register $t0 = g + h
add $t0, $a0, $a1
# register $t1 = i + j
add $t1, $a1, $a3
# f = $t0 - $t1 or (g+h) - (i+j)
sub $s0, $t0, $t1  

# move the value of register s0 to v0 to return the value of f
add $v0, $s0, $zero 

# restore register $s0
lw $s0, 0($sp)
# restore register $t0 
lw $t0, 4($sp)  
# restore register $t1 
lw $t1, 8($sp)  
# adjust the stack to delete the three items we were done storing
addi $sp, $sp, 12 

# jump back to the calling routine
jr $ra 

