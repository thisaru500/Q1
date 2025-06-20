# (4x / 3) * y 

.data
	prompt_x: .asciiz "Enter a value for x: "
	prompt_y: .asciiz "Enter a value for y: "
	result_msg: .asciiz "The result is: "

.text
main:
    li $v0, 4
    la $a0, prompt_x
    syscall

    li $v0, 5
    syscall
    move $t0, $v0		# t0 = x

    li $v0, 4
    la $a0, prompt_y
    syscall

    li $v0, 5
    syscall
    move $t1, $v0		# t1 = y

	# Calculation
    li $t2, 4
    mul $t2, $t0, $t2     
    li $t3, 3
    div $t2, $t3          
    mflo $t2                 

    mul $t2, $t2, $t1    

    li $v0, 4
    la $a0, result_msg
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    li $v0, 10
    syscall
