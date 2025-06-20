.data
    tab:        .asciiz "\t"

.text
# Subprogram to Exit
exitProgram:
    li $v0, 10
    syscall
    
.text
# Subprogram to Print String (Expects value in $a0)
printString:
    li $v0, 4
    syscall
    jr $ra

.text
# Subprogram to Prompt Integer (Returns result in $v0)
promptInt:
    li $v0, 5
    syscall
    jr $ra

.text
# Subprogram to Print Integer (Expects value in $a0)
printInt:
    li $v0, 1
    syscall
    jr $ra

.text
# Subprogram to Print a Tab
printTab:
    li $v0, 4
    la $a0, tab
    syscall
    jr $ra
