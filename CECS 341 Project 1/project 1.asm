.data
        A: .word 11,12,13,14   #A[] =[10,20,30,40]; 
	B: .word 15,16,17,18   #B[] =[11,12,13,14]; 

.text

la 	$s6, A           	#$s6 = A; 
la 	$s7, B			#$s7 = B; 

sll	$t0, $s0, 2 		#$t0 = f * 4 
add 	$t0, $s6, $t0 		#$t0 = &A[f]; 
sll	$t1, $s1, 2 		#t1 = g * 4
add 	$t1, $s7, $t1 		#t1 = &B[g];
lw	$s0, 0($0) 		#f = A[f]; 
addi 	$t2, $t0, 4 	#$t2 = &A[f] + 4;  
lw	$t0, 0($t2) 		#$t0=A[f+1]; 
add 	$t0, $t0, $s0 		#t0 = A[f] + A[f+1]; 
sw	$t0, 0($t1)		#B[g] = A[f] + A[f + 1]; 
?
