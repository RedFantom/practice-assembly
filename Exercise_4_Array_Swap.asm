# Exercise 4: Swap function
# Swap function for array and function to find index of minimum value in array on certain domain
# Copyright (C) RedFantom 2017

# void swap(int v[], int i, int j) {
#  int tmp;
#  tmp = v[i];
#  v[i] = v[j];
#  v[j] = tmp;
# }

# Swap is a leaf function, $t1 holds the address of v[i], $t2 holds the address of v[j]
swap:	sll $t0, $a1, 2		# index * 4
	add $t1, $a0, $t0	# address of array + index
	lw $t3, ($t1)		# load v[i] into $t3
	sll $t0, $a2, 2		
	add $t2, $a0, $t0
	lw $t4, ($t2)		# load v[j] into $t4
	sw $t3, ($t2)		# v[j] = v[i]
	sw $t4, ($t3)		# v[i] = v[j]
	jr $ra
	
# Min index determines the index of the smallest item in an array from k to n
minindex:
	sll $t0, $a1, 2		# t0 = k
	sll $t1, $a2, 2		# t1 = n
	lw $t2, ($t0)		# min = v[k]
	move $t4, $t0		# min_index = k
	addi $t0, $t0, 4	# i = k + 1
loop: 	slt $t7, $t0, $t1	# i < n
	beq $t7, $zero, exit	# if (i < n) == 0 (which means i >= 0)
	lw $t5, ($t0)		# temp = v[i]
	slt $t6, $5, $t2	# temp (v[i]) < min
	beq $t6, $zero, loop	# temp >= min, so continue with loop
	move $t4, $t0		# min_index = i
	move $t2, $t5		# min = v[i] (which is stored in temp, in $t5)
	j loop			# loop again
exit:	move $v0, $t4		# result = min_index
	jr $ra			# return
	

	
	



