#	main{ 
#		int i = prompt("Enter your number"); 
#		int j = i % 2; 
#		print("A result of 0 is even, a result of 1 is odd: result = " + 
#		j; 
#	} 

.data
	prompt: .asciiz "Enter your number: "
	result_msg: .asciiz "A result of 0 is even, a result of 1 is odd: result = "

.text
main:

    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall
    move $t0, $v0 

    andi $t1, $t0, 1

    li $v0, 4
    la $a0, result_msg
    syscall

    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 10
    syscall


