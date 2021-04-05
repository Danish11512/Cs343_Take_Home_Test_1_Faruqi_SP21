.data
b: .word -1
newline: .asciiz "\n"
.text

MAIN:

jal Faruqi_natural_generator

# print the result
add $a0, $zero, $v0 
# 1 for integer
li $v0, 1 
syscall

# new line
#set syscall to 4 -- string
li $v0, 4
la $a0, newline 
syscall

jal Faruqi_natural_generator

# print the result
add $a0, $zero, $v0
# set the system call value to be 4 -- ie print 
li $v0, 1
syscall

# print a new line
# set syscall to 4 -- string
li $v0, 4
la $a0, newline 
syscall


jal Faruqi_natural_generator

# print the result
# set the syscall to  4 --  print
add $a0, $zero, $v0
li $v0, 1
syscall

# print a new line
# set syscall to 4 -- string
li $v0, 4
la $a0, newline
syscall

j END 

Faruqi_natural_generator:

# we need to store t1, t0, t2, and s0 onto stack
addi $sp, $sp, -16

. 
sw $t0, 0($sp)
sw $t1, 4($sp)
sw $t2, 8($sp)
sw $s0, 12($sp)

# Register t1,  a = 1
li $t1, 1 
# s0 = address of b
la $s0, b 
#t2 = b
lw $t2, 0($s0) 
# increment b by 1
addi $t2, $t2, 1
# store the updated value of b in memory
sw $t2, 0($s0) 

# t0 = a + b
add $t0, $t1, $t2 

# place a + b in return 
add $v0, $zero, $t0 


# restore old register values that are on stack
lw $t0, 0($sp)
lw $t1, 4($sp)
lw $t2, 8($sp)
lw $s0, 12($sp)

 # deallocate the space 
addi $sp, $sp, 16

# jump to caller
jr $ra


END: 