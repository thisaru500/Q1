.data
newline: .asciiz "\n"

.text
    li $t0, 1      # pow = 1
    li $t1, 0      # x = 0

while_loop:
    beq $t0, 128, end_while  # Exit loop if pow == 128

    mul $t0, $t0, 2   # pow = pow * 2
    addi $t1, $t1, 1  # x = x + 1

    j while_loop      # Repeat loop

end_while:
