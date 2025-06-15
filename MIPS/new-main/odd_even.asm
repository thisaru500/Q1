.data
prompt: .asciiz "Enter a number: "
evenMsg: .asciiz "The number is even\n"
oddMsg: .asciiz "The number is odd\n"

.text
main:
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    li $t1, 2
    div $t0, $t1
    mfhi $t2

    beqz $t2, printEven
    la $a0, oddMsg
    j printResult

printEven:
    la $a0, evenMsg

printResult:
    li $v0, 4
    syscall

    li $v0, 10
    syscall
