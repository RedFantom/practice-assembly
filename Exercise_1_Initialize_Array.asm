# Exercise 1 : Initialize Array to zeros
# Simple Assembly practice function to initialize a given array to zeros
# Copyright (C) RedFantom 2017

# C code
# void clear(int array[], int size) {
#   int i;
#   for (i = 0; i < size; i += 1)
#     array[i] = 0;
# }

.text

clear:
	move $t0, $zero 	# int i = 0
loop:
	sll $t1, $t0, 2		# t1 = i * 4
	add $t1, $a0, $t1	# t1 = &array[i]
	sw $zero, 0($t1)	# array[i] = 0
	addi $t0, 1		# i += 1
	slt $t2, $t0, $a1	# t2 = i < size
	bne $t2, $zero, loop	# if (t2 != 0) -> loop
	jr $ra			# return
	
	
	
	
