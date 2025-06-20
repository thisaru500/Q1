.data
    star:      .asciiz "*"
    newline:   .asciiz "\n"

.text
main:
    li $t0, 6          # Outer loop counter (rows = 6)
	outer_loop:
    		li $t1, 0      
		inner_loop:			
    			blt $t1, $t0, print_star   # if $t1 < $t0, print star
    			j print_newline            # else go to newline

			print_star:
    				li $v0, 4
    				la $a0, star
    				syscall

    				addi $t1, $t1, 1           # t1++
    				j inner_loop

			print_newline:
  	  			li $v0, 4
    				la $a0, newline
    				syscall

    		subi $t0, $t0, 1           # t0--
    		bgtz $t0, outer_loop       # repeat if t0 > 0

    # Exit program
    li $v0, 10
    syscall
