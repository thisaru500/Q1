.data
 	prompt: .asciiz "\nEnter an integer, -1 to stop: " 
	output: .asciiz "\nYou entered: " 
	
.text
main:
	li $v0, 4
 	la $a0, prompt 
	syscall
	
 	li $v0, 5
 	syscall
 	move $s0, $v0
 	
 	start_loop:
 		sne $t1, $s0, -1			# If $s0 != -1, $t1 -> 1 ; 0
 		beqz $t1, end_loop		# $t1 == 0, jump to 'end_loop
 		
 		# code block
 		li $v0, 4
 		la $a0, output
 		syscall
 		
 		move $a0, $s0			# print the integer stored in $s0
 		li $v0, 1
 		syscall
 		
 		li $v0, 4				# Again ask the prompt
 		la $a0, prompt 
		syscall
		
 		li $v0, 5				# Read the integer
 		syscall
 		move $s0, $v0
 		
 		j start_loop				# Jump unconditionally to 'start_loop' 
 
 		end_loop:
 			li $v0,10
 			syscall
