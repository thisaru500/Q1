.data
num:    .word 5
result: .word 1
newline: .asciiz "\nFactorial is: "

.text
.globl main

main:
    lw $t0, num
    li $t1, 1

loop:
    blez $t0, end
    mul  $t1, $t1, $t0
    sub  $t0, $t0, 1
    j loop

end:
    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 1
    move $a0, $t1
    syscall

    li $v0, 10
    syscall
