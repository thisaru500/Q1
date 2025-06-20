.data
	prompt1:    .asciiz "Enter first number : "
	prompt2:    .asciiz "Enter second number : "
	
	firstNum:	.asciiz "\nFirst number : "
	secondNum:	.asciiz "\nSecond number : "
	
	resultAdd:  .asciiz "\nSummation : "
	resultSub:  .asciiz "\nSubtraction : "
	resultMul:  .asciiz "\nMultiplication : "
	resultDiv:  .asciiz "\nDivision : "
	
	invalidMsg: .asciiz "\nInvalid operation: division by zero.\n"

.text
main:
    li $v0, 4
    la $a0, prompt1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0    # $t0 = num1

    li $v0, 4
    la $a0, prompt2
    syscall

    li $v0, 5
    syscall
    move $t1, $v0    # $t1 = num2
    
    
    # First number
    li $v0, 4
    la $a0, firstNum
    syscall
    
    li $v0, 1
    move $a0, $t0
    syscall
    
    # Second number
    li $v0, 4
    la $a0, secondNum
    syscall
    
    li $v0, 1
    move $a0, $t1
    syscall


    # Addition
    add $t2, $t0, $t1
    
    li $v0, 4
    la $a0, resultAdd
    syscall
    
    li $v0, 1
    move $a0, $t2
    syscall

    # Subtraction
    sub $t2, $t0, $t1
    
    li $v0, 4
    la $a0, resultSub
    syscall
    
    li $v0, 1
    move $a0, $t2
    syscall

    # Multiplication
    mul $t2, $t0, $t1
    
    li $v0, 4
    la $a0, resultMul
    syscall
    
    li $v0, 1
    move $a0, $t2
    syscall

    # Division 
    beq $t1, $zero, divError   # If divisor is 0, go to error message
    
    div $t0, $t1
    mflo $t2
    li $v0, 4
    la $a0, resultDiv
    syscall
    li $v0, 1
    move $a0, $t2
    syscall
    
    j endProgram               # Skip the error label after successful division

	divError:
    		li $v0, 4
    		la $a0, invalidMsg
    		syscall
    
    # Exit
	endProgram:
    		li $v0, 10
    		syscall
