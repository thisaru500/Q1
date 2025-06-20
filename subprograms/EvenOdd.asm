.data
	prompt:		.asciiz "Enter an integer : "
    evenMsg:   .asciiz "\nThe number is Even.\n"
    oddMsg:    .asciiz "\nThe number is Odd.\n"
    errMsg:    .asciiz "\nPlease enter a positive integer!\n"

.text
main:
	la $a0, prompt
    jal printString
    
    jal promptInt
    move $t0, $v0				# $t0 = nym

    blez $t0, show_error  		# If num <= 0, show error

    andi $t1, $t0, 1      		# Check LSB using bitwise AND
    beq $t1, $zero, print_even	# If LSB is 0, number is even

print_odd:
    la $a0, oddMsg
    jal printString
    j exit

print_even:
    la $a0, evenMsg
    jal printString
    j exit

show_error:
    la $a0, errMsg
    jal printString

exit:
    jal exitProgram

.include "EvenOdd_util.asm"
