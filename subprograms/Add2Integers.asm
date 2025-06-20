.data
	num1: .asciiz "Enter first number: "
	num2: .asciiz "Enter second number: "
	result: .asciiz "Result is "
	newline: .ascii "\n"

.text
main:
	li $v0, 4
	la $a0, num1
	syscall

	li $v0, 5
	syscall 
	move $a1, $v0		# $a1 = num1

	li $v0, 4
	la $a0, num2
	syscall

	li $v0, 5			
	syscall 
	move $a2, $v0		# $a2 = num2  

	li $v0, 4
	la $a0, newline
	syscall
	
	li $v0, 4
	la $a0, result
	syscall

	jal addition

	move $a0, $v0
	li $v0, 1                
	syscall

	jal exit


.include "Add2Integers_utils.asm"

