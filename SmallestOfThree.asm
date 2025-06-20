.data
	prompt1:		.asciiz "Enter first number : "
	prompt2:    .asciiz "Enter second number : "
	prompt3:    .asciiz "Enter third number : "
	result:	.asciiz "\nSmallest 0f three numbers : "

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
    
    li $v0, 4
    la $a0, prompt3
    syscall

    li $v0, 5
    syscall
    move $t2, $v0    # $t2 = num3
    
    # Find smallest($t3)
    move $t3, $t0       # First assume num1 is smallest

    bge $t1, $t3, check_third
    move $t3, $t1       # if num2 < min

	check_third:
    		bge $t2, $t3, print_result
    		move $t3, $t2       # if num3 < min

	print_result:
    		li $v0, 4
    		la $a0, result
    		syscall

    li $v0, 1
    move $a0, $t3
    syscall

    li $v0, 10
    syscall
    
    
    
    
    
