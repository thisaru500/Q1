.data
	num: .word -5
 	PositiveNumber: .asciiz "Number is positive"
 	NegativeNumber: .asciiz "Number is negative"

.text
main:
	lw $t0, num				# Load num into register $t0
 	sgt $t1, $t0, $zero 		# If $t0 > 0, set $t1 to 1. else 0 (Here $t1 is a boolean)
	beqz $t1, else			# If $t1 == 0, jump to 'end_if'
 	
 	# if block
 	li $v0, 4				# print ("Number is positive") 
 	la $a0, PositiveNumber	
 	syscall		
 	
 	j end_if
 	
 	# else block
 	else:
 		li $v0, 4
 		la $a0, NegativeNumber
 		syscall
 	
 	end_if: 
		li $v0, 10 
		syscall
