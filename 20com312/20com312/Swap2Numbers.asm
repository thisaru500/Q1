.data
	prompt_x: .asciiz "Enter x: "
	prompt_y: .asciiz "Enter y: "
	after_swap: .asciiz "After swapping:\n"
	msg_x: .asciiz "x = "
	msg_y: .asciiz "\ny = "

.text
main:
    li $v0, 4
    la $a0, prompt_x
    syscall

    li $v0, 5
    syscall
    move $t0, $v0       # $t0 = x

    li $v0, 4
    la $a0, prompt_y
    syscall

    li $v0, 5
    syscall
    move $t1, $v0       # $t1 = y

    # Swap using extra space (temp/$t2)
    move $t2, $t0       # temp = x
    move $t0, $t1       # x = y
    move $t1, $t2       # y = temp

    # Print after swap
    li $v0, 4
    la $a0, after_swap
    syscall

    li $v0, 4
    la $a0, msg_x
    syscall

    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 4
    la $a0, msg_y
    syscall

    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 10
    syscall
