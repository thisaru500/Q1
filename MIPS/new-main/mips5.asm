# Assume i, j, g, h, and f are stored in registers:
# $t0 = i, $t1 = j, $t2 = g, $t3 = h, $t4 = f

beq $t0, $t1, add_f  # If i == j, jump to add_f

sub $t4, $t4, $t0    # f = f - i
j end_program

add_f:
    add $t4, $t2, $t3 # f = g + h
    sub $t4, $t4, $t0 # f = f - i

end_program:
