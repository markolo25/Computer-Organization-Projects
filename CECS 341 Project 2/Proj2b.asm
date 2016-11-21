	.data
	
memory: .word

	.text
	
	li $t0, 10 			#intialize $t0 with max value which is 10	
	li $t2, 2 			#intialize $t2 with 2 like i = 2 in C
	la $t3, memory		#store memory address into register $t3
	
loop:
	sw $t2, 0($t3)		#store $t2's value into address pointed at by $t3
	beq $t2, $t0, end 	#if t1 == 10 finish	
	addi $t2, $t2, 2	#Add 2 to $t2 to go to the next number in the sequence
	addi $t3, $t3, 4	#increment address where we are storing
	j loop
end:

