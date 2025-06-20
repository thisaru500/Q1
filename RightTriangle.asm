.data
	prompt1: .asciiz "Enter side 1: "
	prompt2: .asciiz "Enter side 2: "
	prompt3: .asciiz "Enter side 3: "
	yes:  .asciiz "Right triangle\n"
	no:   .asciiz "Not a right triangle\n"

.text
main:
    li $v0, 4
    la $a0, prompt1
    syscall
    
    li $v0, 5
    syscall
    move $t0, $v0    # $t0 = side1

    li $v0, 4
    la $a0, prompt2
    syscall
    
    li $v0, 5
    syscall
    move $t1, $v0    # $t1 = side2

    li $v0, 4
    la $a0, prompt3
    syscall
    
    li $v0, 5
    syscall
    move $t2, $v0    # $t2 = side3

	# Calculation
    mul $t3, $t1, $t1
    mul $t4, $t2, $t2
    mul $t5, $t0, $t0
    
    add $t6, $t3, $t4
    beq $t5, $t6, print_yes
    
    add $t7, $t4, $t5
    beq $t3, $t7, print_yes
    
    add $t8, $t3, $t5
    beq $t8, $t4, print_yes

    # If none match
    li $v0, 4
    la $a0, no
    syscall
    j exit

print_yes:
    li $v0, 4
    la $a0, yes
    syscall

exit:
    li $v0, 10
    syscall
