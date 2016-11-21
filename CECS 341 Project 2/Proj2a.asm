	.data
out_string: 	.asciiz 	"Goodbye!\n"
space: 			.asciiz 	"\n"
	
	.text

	li $t0, 10 
	li $t2, 2				# i = 2
	
loop:
	beq $t2, $t0, end 		#if t1 == 10 finish	
	
							#PRINTING BLOCK
	li $v0, 1 				#set to print integer
	add $a0, $t2, $zero 	#move value of t2 to arg 0 for printing
	syscall 				#execute syscall service
	li $v0, 4 				#set to string mode
	la $a0, space 			#give the space string as an arg
	syscall					#execute syscall service
							#END OF PRINT BLOCK
	
	addi $t2, $t2, 2
	addi $t1, $t1, 1  		# add 1 to t1
	j loop
end:
							#PRINTING BLOCK
	li $v0, 4 				#Set to print string
	la $a0, out_string		#give "out_string" as an argument
	syscall 				#execute syscall service
