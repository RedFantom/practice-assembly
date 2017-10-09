# Exercise 3: Two small exercises
# Two teensy exercises combined into a single file
# Copyright (C) RedFantom 2017

.data
debug: 	.asciiz "Increased amount\n"	
str:  	.asciiz "Exit\n"

.text

get:	addi $v0, $zero, 5	# Read i from stdin
	syscall
	move $s0, $v0
	addi $v0, $zero, 5	# Read j from stdin
	syscall
	move $s1, $v0
if:	sne $t0, $s0, $s1	# i == j
	beq $t0, $zero, exit	# if (i == j) == 0, jump to else
	move $s2, $zero		# sum = 0
	move $t0, $zero		# index = 0
incr: 	add $s2, $s2, $s0	# sum = sum + i
	li $v0, 4
	la $a0, debug	
	syscall
	sge $t1, $s2, $s1	# sum < j
	addi $t0, $t0, 1	# i += 1
	beq $t1, $zero, incr	# for i < j repeat
exit:	li $v0, 4
	la $a0, str
	syscall
	move $a0, $s2		# Print sum
	addi $v0, $zero, 1
	syscall
	addi $v0, $zero, 10	# Exit
	syscall			
	
