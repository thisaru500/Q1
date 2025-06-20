.data
	prompt1: .asciiz "Enter width: "
	prompt2: .asciiz "Enter height: "
	area_msg: .asciiz "Area: "
	perimeter_msg: .asciiz "\nPerimeter: "

.text
main:
   
    li $v0, 4
    la $a0, prompt1
    syscall

    li $v0, 5
    syscall
    move $t0, $v0  

    li $v0, 4
    la $a0, prompt2
    syscall

    li $v0, 5
    syscall
    move $t1, $v0  

    mul $t2, $t0, $t1

    li $v0, 4
    la $a0, area_msg
    syscall

    li $v0, 1
    move $a0, $t2
    syscall

    add $t3, $t0, $t1
    mul $t4, $t3, 2

    li $v0, 4
    la $a0, perimeter_msg
    syscall

    li $v0, 1
    move $a0, $t4
    syscall

    li $v0, 10
    syscall



