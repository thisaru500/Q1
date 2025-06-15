.data 
prompt: .asciiz "Enter a number: "
InvalidInput: .asciiz "Number must be > 0 and < 100\n"
OutputA: .asciiz "Grade is A\n"
OutputB: .asciiz "Grade is B\n"
OutputC: .asciiz "Grade is C\n"
OutputD: .asciiz "Grade is D\n"
OutputF: .asciiz "Grade is F\n"

.text
main:
    li $v0, 4
    la $a0, prompt
    syscall

    li $v0, 5
    syscall
    move $s0, $v0

    slti $t1, $s0, 0
    sgt $t2, $s0, 100
    or $t1, $t1, $t2
    beqz $t1, grade_A

    la $a0, InvalidInput
    j Print_End

grade_A:
    sge $t1, $s0, 90
    beqz $t1, grade_B
    la $a0, OutputA
    j Print_End

grade_B:
    sge $t1, $s0, 80
    beqz $t1, grade_C
    la $a0, OutputB
    j Print_End

grade_C:
    sge $t1, $s0, 70
    beqz $t1, grade_D
    la $a0, OutputC
    j Print_End

grade_D:
    sge $t1, $s0, 60
    beqz $t1, grade_F
    la $a0, OutputD
    j Print_End

grade_F:
    la $a0, OutputF

Print_End:
    li $v0, 4
    syscall

    li $v0, 10
    syscall
