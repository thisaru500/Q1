.data
	prompt: .asciiz "Enter the value to calculate the sum up to: " 
	output: .asciiz "The final result is: " 

.text
main:
    la $a0, prompt      
    li $v0, 4          
    syscall            

    li $v0, 5          
    syscall            
    move $s0, $v0     # $s0 = n

    # Initialize variables
    li $s1, 0          # i = 0
    li $s2, 0          # total = 0

	start_loop:
    		# If user input < i (exit condition)
    		blt $s0, $s1, end_loop

    		add $s2, $s2, $s1  # total += i
    		addi $s1, $s1, 1   # i++

    		b start_loop       # Repeat loop

	end_loop:
    		la $a0, output      
    		li $v0, 4          
    		syscall            

    		move $a0, $s2      
    		li $v0, 1          
    		syscall            

    		li $v0, 10         
    		syscall  

