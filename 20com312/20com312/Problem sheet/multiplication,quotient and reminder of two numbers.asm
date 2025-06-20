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

    mul $t2, $t0, $t1       

    li $v0, 4               
    la $a0, mult_msg
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

    div $t0, $t1            
    mflo $t3                
    mfhi $t4                

    li $v0, 4               
    la $a0, quot_msg
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

    li $v0, 4               
    la $a0, rem_msg
    syscall

    li $v0, 11              
    li $a0, 10              
    syscall

    li $v0, 1               
    move $a0, $t4           
    syscall

    li $v0, 11              
    li $a0, 10              
    syscall

    li $v0, 10              
    syscall

 .data
	prompt_num1: .asciiz "Enter the first number: "
	prompt_num2: .asciiz "Enter the second number: "
	mult_msg: .asciiz "The multiplication result is: "
	quot_msg: .asciiz "The quotient is: "
	rem_msg: .asciiz "The remainder is: "

