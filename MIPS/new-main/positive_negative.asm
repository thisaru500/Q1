.data 
	prompt1: .asciiz "Enter a number"
	positive: .asciiz "The number is positive"
	negative: .asciiz "The number is negative"
	
.text
main:
	li $v0, 4
	la $a0, prompt1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	bgtz $t0, positivelabel
	b label
	
	
	positivelabel:
		li $v0, 4
		la $a0, positive
		syscall 
		b exit
	
	label:	
		beqz $t0, positivelabel
		b negativelabel
		
	negativelabel:
		li $v0, 4
		la $a0, negative
		syscall
		b exit
	
	exit:
	li $v0, 10
	syscall