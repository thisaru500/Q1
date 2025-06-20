.data 
	num: .word -1
	
 	OutputA: .asciiz "Grade is A"
 	OutputB: .asciiz "Grade is B"
 	OutputC: .asciiz "Grade is C"
 	OutputD: .asciiz "Grade is D"
 	OutputF: .asciiz "Grade is F"
 	InvalidInput: .asciiz "Number must be > 0 and < 100"

.text
main:
 	lw $s0, num				# Load num into register $s0
 	
 	#if block
 	slt $t1, $s0, $zero		# If $s0 < 0, $t1 -> 1 ; 0
 	sgt $t2, $s0, 100		# If $s0 > 100, $t2 -> 1 ; 0
 	or $t1, $t1, $t2			# $t1 = $t1 || $t2
 	beqz $t1, grade_A		# If $t1 == 0 , jump to 'grade_A'
 	
 	#invalid input block
 	la $a0, InvalidInput
 	j Print_End
 	
 	grade_A:
 		sge $t1, $s0, 90
 		beqz $t1, grade_B
 		la $a0, OutputA
 		j Print_End
 	
 	grade_B:
 		sge $t1, $s0, 80
 		beqz $t1, grade_C
 		la $a0, OutputB
 		j Print_End
 		
 	grade_C:
 		sge $t1, $s0, 70
 		beqz $t1, grade_D
 		la $a0, OutputC
 		j Print_End
 
 	grade_D:
 		sge $t1, $s0, 60
 		beqz $t1, else
 		la $a0, OutputD
 		j Print_End
 
 	else:
 		la $a0, OutputF
 		j Print_End
 
 	Print_End:
 		li $v0,4
 		syscall
 		li $v0,10
 		syscall
