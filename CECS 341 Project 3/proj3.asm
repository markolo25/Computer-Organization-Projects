	.data
array: 	.word 1,2,5,7,10		#intialize the array of given values
answer: .word 0,0,0,0,0			#intialize the array to store values
	
	.text	
	la 	$s0, array				#store address of given values to $s0
	la 	$s1, answer				#store address of arrays to store values to $s1
	li	$t3, 5					#i = 5 for the loop
	
arrayFact:
	lw  	$a0, 0($s0)			#load current value of given value and save in argument0 register
	jal 	fact				#call factorial function
 	sw	$v0, 0($s1)				#save result of factorial into memory
 	addi	$s0, $s0, 4 		#increment to next item in read array  "array"
 	addi	$s1, $s1, 4			#increment to next item in write array "answer"
 	addi	$t3, $t3,-1			#decrement loop counter e.g --i
 	bne	$t3, $zero, arrayFact	#i > 0
 	j 	end						#jump to bottom of program since we're done
 
 #--------FACTORIAL START---------------------#
fact:
	addi 	$sp, $sp, -8     	# adjust stack for 2 items
	sw   	$ra, 4($sp)      	# save return address
	sw   	$a0, 0($sp)     	# save argument
	slti 	$t0, $a0, 1      	# test for n < 1
	beq  	$t0, $zero, L1
	addi 	$v0, $zero, 1    	# if so, result is 1
	addi 	$sp, $sp, 8      	#   pop 2 items from stack
	jr   	$ra              	#   and return
L1:
	addi $a0, $a0, -1     		# else decrement n
	jal  fact             		# recursive call
	lw   $a0, 0($sp)      		# restore original n
	lw   $ra, 4($sp)      		#   and return address
	addi $sp, $sp, 8      		# pop 2 items from stack
	mul  $v0, $a0, $v0    		# multiply to get result
	jr   $ra             		# and return
#-------------FACTORIAL END BLOCK------------#
 
 end:
	
	
	