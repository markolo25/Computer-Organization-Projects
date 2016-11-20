	.data
memory: .word
	
	
	.text
	
	li $t0, 10 
	li $t2, 2 		# i = 2
	la $t3, memory	
	
loop:
	beq $t2, $t0, end 	#if t1 == 10 finish	
	sw $t2, 0($t3)
	addi $t2, $t2, 2
	addi $t3, $t3, 4
	addi $t1, $t1, 1  	# add 1 to t1
	j loop
end:

