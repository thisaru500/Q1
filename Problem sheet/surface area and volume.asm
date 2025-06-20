.data
	prompt1: .asciiz "Enter length: "
	prompt2: .asciiz "Enter width: "
	prompt3: .asciiz "Enter height: "
	area_msg: .asciiz "Surface area: "
	volume_msg: .asciiz "Volume: "

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

    li $v0, 4
    la $a0, prompt3
    syscall

    li $v0, 5
    syscall
    move $t2, $v0  

    mul $t3, $t0, $t1
    mul $t4, $t0, $t2
    mul $t5, $t1, $t2
    add $t6, $t3, $t4
    add $t7, $t6, $t5
    mul $t8, $t7, 2

    li $v0, 4
    la $a0, area_msg
    syscall

    li $v0, 1
    move $a0, $t8
    syscall

    mul $t9, $t0, $t1
    mul $s0, $t9, $t2

    li $v0, 4
    la $a0, volume_msg
    syscall

    li $v0, 1
    move $a0, $s0
    syscall

    li $v0, 10
    syscall



