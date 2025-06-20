.data
    prompt:     .asciiz "Enter the number of rows : "
    newline:    .asciiz "\n"
    star:       .asciiz "*"

.text
main:
    li $v0, 4
    la $a0, prompt 
    syscall
    
    li $v0, 5
    syscall 
    move $t0, $v0      # $t0 = number of rows (outer loop counter)

	outer_loop:
    		blez $t0, exit     # Exit if $t0 <= 0

  		move $t1, $t0      # $t1 = stars to print for this row

		print_stars:
    			blez $t1, print_newline   # If no more stars, print newline

    			li $v0, 4
    			la $a0, star        # Print "*"
    			syscall

    			sub $t1, $t1, 1     # t1--
    			j print_stars

		print_newline:
    			li $v0, 4
    			la $a0, newline
    			syscall

    		sub $t0, $t0, 1     # t0--
    		j outer_loop

exit:
    li $v0, 10
    syscall
