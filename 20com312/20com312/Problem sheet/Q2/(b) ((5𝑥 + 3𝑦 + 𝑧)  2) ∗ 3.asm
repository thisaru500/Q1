# ((5x + 3y + z) / 2) * 3

.data
	prompt_x: .asciiz "Enter a value for x: "
	prompt_y: .asciiz "Enter a value for y: "
	prompt_z: .asciiz "Enter a value for z: "
	result_msg: .asciiz "The result is: "

.text
main:
    li $v0, 4
    la $a0, prompt_x
    syscall

    li $v0, 5
    syscall
    move $t0, $v0			# t0 = x 

    li $v0, 4
    la $a0, prompt_y
    syscall

    li $v0, 5
    syscall
    move $t1, $v0			# t1 = y 

    li $v0, 4
    la $a0, prompt_z
    syscall

    li $v0, 5
    syscall
    move $t2, $v0			# t2 = z

    li $t3, 5
    mul $t3, $t0, $t3
    li $t4, 3
    mul $t4, $t1, $t4
    add $t3, $t3, $t4
    add $t3, $t3, $t2

    li $t5, 2
    div $t3, $t5
    mflo $t3             

    li $t5, 3
    mul $t3, $t3, $t5

    li $v0, 4
    la $a0, result_msg
    syscall

    li $v0, 1
    move $a0, $t3
    syscall

    li $v0, 10
    syscall
    

