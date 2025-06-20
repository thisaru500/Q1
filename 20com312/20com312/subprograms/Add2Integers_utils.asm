addition:
	add $a1, $a1, $a2
	move $v0, $a1		# Should move to $v0 before return from the sub program
	jr $ra				# jr $ra means jump to return address — the next instruction after the jal call to it
	jal exit			

exit:
	li $v0, 10
	syscall
