    .data
array:     .word 1,2,5,7,10           #intialize the array of given values
answer:    .word 0,0,0,0,0            #intialize the array to store values
    
    .text    
     la      $s0, array               #store address of given values to $s0
     la      $s1, answer              #store address of arrays to store values to $s1
     li      $t3, 5                   #i = 5 for the loop
    
arrayFact:
     lw      $a0, 0($s0)              #load current value of given value and save in argument0 register
     jal     fact                     #call factorial function
     sw      $v0, 0($s1)              #save result of factorial into memory
     addi    $s0, $s0, 4              #increment to next item in read array  "array"
     addi    $s1, $s1, 4              #increment to next item in write array "answer"
     addi    $t3, $t3,-1              #decrement loop counter e.g --i
     bne     $t3, $zero, arrayFact    #i > 0
     j       end                      #jump to bottom of program since we're done
 
 #--------FACTORIAL START---------------------#
fact:
	addi $sp, $sp, -8 # space for two words
	sw $ra, 4($sp) # save return address
	sw $a0, 0($sp) # temporary variable to hold n
	li $v0, 1
	slt $t0, $zero, $a0
	beq $t0, $zero, fact_return
	addi $a0, $a0, -1
	jal fact
	lw $a0, 0($sp) # retrieve original n
	mul $v0, $v0, $a0 # n * fact(n - 1)
fact_return:
	lw $ra 4($sp) # restore $ra
	addi $sp, $sp, 8 # restore $sp
	jr $ra # back to caller
#-------------FACTORIAL END BLOCK------------#
 
 end:
    
    
    
