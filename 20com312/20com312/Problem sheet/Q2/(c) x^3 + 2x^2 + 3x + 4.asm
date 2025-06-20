#x^2 + x^2 + 3x + 4

.data
	prompt_x: .asciiz "Enter a value for x: "
	result_msg: .asciiz "The result is: "

.text
main:
    li $v0, 4
    la $a0, prompt_x
    syscall

    li $v0, 5
    syscall
    move $t0, $v0          	# t0 = x 

    mul $t1, $t0, $t0      
    mul $t2, $t1, $t0       

    mul $t3, $t1, 2         

    mul $t4, $t0, 3         

    add $t2, $t2, $t3       
    add $t2, $t2, $t4      
    addi $t2, $t2, 4       

    li $v0, 4
    la $a0, result_msg
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 10
    syscall
    


