.data
	newLine: .asciiz "\n"

.text
main:
    addiu $t0, $zero, 60000     # Try to store 60000 using signed addition
    li $v0, 1                   
    move $a0, $t0               
    syscall                    

    # Newline
    li $v0, 4
    li $a0, newLine
    syscall

    ori $t1, $zero, 60000       # Try to store 60000 using zero-extended OR
    li $v0, 1
    move $a0, $t1
    syscall                     

    li $v0, 10
    syscall

############################################################
# ? Observation and Explanation:
#
# ? addiu $t0, $zero, 60000
#   - 'addiu' uses **sign-extension** for the 16-bit immediate.
#   - 60000 = 0xEA60, which is a **negative number** in 16-bit signed:
#     60000 - 65536 = -5536
#   - So $t0 will contain **-5536** (0xFFFFEA60)
#
# ? ori $t1, $zero, 60000
#   - 'ori' uses **zero-extension** for the 16-bit immediate.
#   - It loads **60000 correctly** as an unsigned value.
#   - So $t1 will contain **60000** (0x0000EA60)
#
# ? Output:
# -5536
# 60000
#
# ? Are the results the same?
# ? No. `addiu` treats 60000 as signed (-5536), `ori` treats it as unsigned (60000).
#
# ? Will one run faster than the other?
# ? No practical speed difference in MARS (it's a simulator).
# ? On real hardware: both are simple instructions (one cycle), negligible difference.
#
############################################################
