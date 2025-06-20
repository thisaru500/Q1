# s = (a+b) - (c+101)

.data
	prompt_a: .asciiz "Enter value for a: "
	prompt_b: .asciiz "Enter value for b: "
	prompt_c: .asciiz "Enter value for c: "
	result:   .asciiz "The result s = "

.text
main:
    li $v0, 4
    la $a0, prompt_a
    syscall

    li $v0, 5        
    syscall
    move $t0, $v0       # $t0 = a

    li $v0, 4
    la $a0, prompt_b
    syscall

    li $v0, 5
    syscall
    move $t1, $v0       # $t1 = b

    li $v0, 4
    la $a0, prompt_c
    syscall

    li $v0, 5
    syscall
    move $t2, $v0      	# $t2 = c

    add $t3, $t0, $t1	# $t3 = a + b
    addi $t4, $t2, 101	# $t4 = c + 101

    # Compute s = (a + b) - (c + 101)
    sub $t5, $t3, $t4       # <-- ? This instruction computes s

    li $v0, 4
    la $a0, result
    syscall

    li $v0, 1
    move $a0, $t5
    syscall

    li $v0, 10
    syscall

############################################################
#
# (a) Suppose user enters:
#     a = 5, b = 10, c = -30
#
#     s = (5 + 10) - (-30 + 101)
#       = 15 - 71
#       = -56
#     ? Expected value of s = -56
#
# (b) The instruction that computes s is:
#     ? sub $t5, $t3, $t4
#     - The register used to store s is: `$t5`
#
# (c) Address of this instruction in MARS:
#     ? Load the program in MARS and assemble.
#     ? The address will typically be something like:
#       `0x00400005C` (you'll see this in the Text Segment view)
#
# (d) Breakpoint:
#     ? Set a breakpoint on the line: `sub $t5, $t3, $t4`
#     ? Run with inputs a=5, b=10, c=-30
#     ? At the breakpoint, inspect register `$t5`:
#        Decimal: -56
#        Hexadecimal: `0xFFFFFFC8`
#
############################################################
