.data
	prompt1: 	.asciiz "Enter Number 1 : "
	prompt2: 	.asciiz "Enter Number 2 : "
	menu: 		.asciiz "\nMenu\n\t1 - Addition\n\t2 - Subtraction\n\t3 - Multiplication\n\t4 - Division(Quotient)\n\t5 - Modulus(Remainder)n\nSelect the operation from the menu : "
	
	# Operator symbols
	addOpt:		.asciiz " + "
	subOpt: 		.asciiz " - "
	mulOpt:		.asciiz " * "
	divOpt: 		.asciiz " / "
	modOpt: 		.asciiz " % "
	equalOpt: 	.asciiz " = "
	
	errorMsg: 	.asciiz "Error! Can't divide by zero"
	
.text
main:
	li $v0, 4
	la $a0, prompt1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0		# t0 = num1
	
	li $v0, 4
	la $a0, prompt2
	syscall
	
	li $v0, 5
	syscall
	move $t1, $v0		# t1 = num2
	
	# Show Menu
	li $v0, 4
	la $a0, menu
	syscall
	
	li $v0, 5
	syscall
	move $t2, $v0		# $t2 = choice
	
	li $v0, 1
	move $a0, $t0
	syscall

	beq $t2, 1, addition
	beq $t2, 2, subtraction
	beq $t2, 3, multiplication
	beq $t2, 4, division
	beq $t2, 5, modulus
	j End
	
	addition:
		add $t3, $t0, $t1
		
		li $v0, 4
		la $a0, addOpt
		syscall
		
		li $v0, 1
		move $a0, $t1
		syscall
		
		li $v0, 4
		la $a0, equalOpt
		syscall
		
		li $v0, 1
		move $a0, $t3
		syscall
		
		j End
		
	subtraction:
		sub $t3, $t0, $t1
		
		li $v0, 4
		la $a0, subOpt
		syscall
		
		li $v0, 1
		move $a0, $t1
		syscall
		
		li $v0, 4
		la $a0, equalOpt
		syscall
		
		li $v0, 1
		move $a0, $t3
		syscall
		
		j End
		
	multiplication:
		mul $t3, $t0, $t1
		
		li $v0, 4
		la $a0, mulOpt
		syscall
		
		li $v0, 1
		move $a0, $t1
		syscall
		
		li $v0, 4
		la $a0, equalOpt
		syscall
		
		li $v0, 1
		move $a0, $t3
		syscall
		
		j End
		
	division:
		beq $t1, $zero, Invalid
		
		div $t0, $t1
		mflo $t3
		
		li $v0, 4
		la $a0, divOpt
		syscall
		
		li $v0, 1
		move $a0, $t1
		syscall
		
		li $v0, 4
		la $a0, equalOpt
		syscall
		
		li $v0, 1
		move $a0, $t3
		syscall
		
		j End
		
	modulus:
		beq $t1, $zero, Invalid
		
		div $t0, $t1
		mfhi $t3
		
		li $v0, 4
		la $a0, modOpt
		syscall
		
		li $v0, 1
		move $a0, $t1
		syscall
		
		li $v0, 4
		la $a0, equalOpt
		syscall
		
		li $v0, 1
		move $a0, $t3
		syscall
		
		j End
		
	Invalid:
		li $v0, 4
		la $a0, errorMsg
		syscall
		
		j End
		
	End:
		li $v0, 10
		syscall
