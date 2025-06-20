    .text
    .globl main

main:
    li $v0, 4               
    la $a0, prompt_num1
    syscall

    li $v0, 5               
    syscall
    move $t0, $v0           

    li $v0, 4               
    la $a0, prompt_num2
    syscall

    li $v0, 5               
    syscall
    move $t1, $v0           

    add $t2, $t0, $t1       

    li $v0, 4               
    la $a0, sum_msg
    syscall

    li $v0, 11              
    li $a0, 10              
    syscall

    li $v0, 1               
    move $a0, $t2           
    syscall

    li $v0, 11              
    li $a0, 10              
    syscall

    sub $t3, $t0, $t1       

    li $v0, 4               
    la $a0, diff_msg
    syscall

    li $v0, 11              
    li $a0, 10              
    syscall

    li $v0, 1               
    move $a0, $t3           
    syscall

    li $v0, 11              
    li $a0, 10              
    syscall

    li $v0, 10              
    syscall


    .data
prompt_num1: .asciiz "Enter the first number: "
prompt_num2: .asciiz "Enter the second number: "
sum_msg: .asciiz "The sum is: "
diff_msg: .asciiz "The difference is: "