.data
	prompt:     .asciiz "\nEnter a number: "
	resultMsg:  .asciiz "\nFactorial is: "
	errorMsg: 	.asciiz "\nFactorial of negative number is undefined."

.text
main:
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall
    move $t0, $v0      # $t0 = num
    
    blt $t0, $zero, print_error		# If a negative number

    li $t1, 1          		# Initialize result to 1 ($t1 = result)

	loop:	 # (While n > 1)
    		blez $t0, endLoop  
    		mul $t1, $t1, $t0  # result *= n
    		addi $t0, $t0, -1  # n -= 1
    		j loop

	endLoop:
    		li $v0, 4
    		la $a0, resultMsg
    		syscall

    		li $v0, 1
    		move $a0, $t1
    		syscall
    		
    		j exit
    	
    	print_error:
    		li $v0, 4
    		la $a0, errorMsg
    		syscall
    		
    		j exit

	exit:
    		li $v0, 10
    		syscall
