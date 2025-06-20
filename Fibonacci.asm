# F(0) = 0 , F(1) = 1
# F(n) = F(n-1) + F(n-2)
# Fibinacci sequence : 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, ...

.data
	prompt: .asciiz "Enter an integer: "
	result: .asciiz "The Fibonacci number is: "
	newline: .asciiz "\n"

.text
main:
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall
    move $t0, $v0  # $t0 = n

    # Check if n == 0
    li $t1, 0
    beq $t0, $t1, print_zero

    # Check if n == 1
    li $t1, 1
    beq $t0, $t1, print_one

    # Initialize first two Fibonacci numbers
    li $t2, 0  # F(0)
    li $t3, 1  # F(1)

    # Initialize counter
    li $t4, 2

fib_loop:
    bgt $t4, $t0, end_loop  # if counter > n, end loop
    add $t5, $t2, $t3  # t5 = F(n-2) + F(n-1)
    move $t2, $t3  # F(n-2) = F(n-1)
    move $t3, $t5  # F(n-1) = F(n)
    addi $t4, $t4, 1  # counter++

    j fib_loop

end_loop:
    move $t0, $t3  # result = F(n)
    j print_result

print_zero:
    li $t0, 0
    j print_result

print_one:
    li $t0, 1

print_result:
    li $v0, 4
    la $a0, result
    syscall

    # Print the Fibonacci number
    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 4
    la $a0, newline
    syscall

    li $v0, 10
    syscall
