.data
	array:      .word 0, 0        # space for two integers
	
    prompt1:    .asciiz "Enter first number : "
    prompt2:    .asciiz "Enter second number : "

    resultAdd:  .asciiz "\nThe Sum is : "
    resultSub:  .asciiz "\nThe Subtraction is : "
    resultMul:  .asciiz "\nThe Multiplication is : "
    resultDiv:  .asciiz "\nThe Division is : "

    invalidMsg: .asciiz "\nInvalid operation: division by zero.\n"

.text
main:
    li $v0, 4
    la $a0, prompt1
    syscall

    li $v0, 5
    syscall
    sw $v0, array        # store first digit at array[0]

    li $v0, 4
    la $a0, prompt2
    syscall

    li $v0, 5
    syscall
    sw $v0, array+4        # store second digit at array[1]

	# Load values into $t0 and $t1
    lw $t0, array        # $t0 = num1
    lw $t1, array+4      # $t1 = num2
    
    
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
    beq $t1, $zero, divError     # If divisor is 0, go to error message

    div $t0, $t1
    mflo $t2                    
    li $v0, 4
    la $a0, resultDiv
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    j endProgram                 # Skip error message

divError:
    li $v0, 4
    la $a0, invalidMsg
    syscall

endProgram:
    li $v0, 10
    syscall
