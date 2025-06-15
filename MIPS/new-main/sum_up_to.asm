.text
la $a0, prompt
li $v0, 4
syscall
li $v0, 5
syscall
move $s1, $v0
li $s0, 0
li $s2, 0

start_loop:
    slt $t1, $s1, $s0  # If s1 < s0, $t1 = 1
    bne $t1, $zero, end_loop # If true, exit loop

    add $s2, $s2, $s0  # total += i
    addi $s0, $s0, 1   # i++
    b start_loop

end_loop:
    la $a0, output
    li $v0, 4
    syscall

    move $a0, $s2
    li $v0, 1
    syscall

exit:
    li $v0,10
    syscall

.data
prompt: .asciiz "Enter the value to calculate the sum up to: "
output: .asciiz "\nThe final result is: "
