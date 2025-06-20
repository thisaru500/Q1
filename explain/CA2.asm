# Write a MIPS program that translates the code below to MIPS assembly code. Use a minimum number of
# instructions. Assume that the value of a, b, i are in registers $s0, $s1, $t0 respectively.
#	for(i=0;i<10;i++)
#		a+=b;

.data
    
.text
main:   
	li $t0, 0          # i = 0
	
	loop:
    		bge $t0, 10, end   # if i >= 10, exit loop
    		add $s0, $s0, $s1  # a += b
    		addi $t0, $t0, 1   # i++
    		
    		j loop
    		
	end:
