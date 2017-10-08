# Exercise 2: Simple leaf function
# Simple function translated from C to assembly to perform operation with numbers
# Copyright (C) RedFantom 2017

# C code:
# int leaf_example (int g, h, i, j) { 
#   int f;
#   f = (g + h) - (i - j);
#   return f;
# }

# Arguments g, h, i and j in $a0, $a1, $a2 and $a3 respectively
# int f in $0
# Result in $v0

.text

leaf: 
	addi $sp, $sp, -4	# Increase the stack pointer to store $s0
	sw $s0, 0($sp) 		# Store $s0 on stack
	add $t0, $a0, $a1	# temp = g + h
	sub $t1, $a2, $a3	# temp = i - j
	sub $s0, $t0, $t1	# f = temp - temp
	# Note that it is also possible to set the value of $v0 immediately
	# instead of storing it in $s0 first, and that means that storing
	# $s0 in the stack first is also unnecessary, but that's not the 
	# point of the exercise.
	move $v0, $s0		# Return value = f
	lw $s0, 0($sp)		# Restore $s0 from stack
	addi $sp, $sp, 4	# Restore $sp to original value
	jr $ra			# return f;
	
	

