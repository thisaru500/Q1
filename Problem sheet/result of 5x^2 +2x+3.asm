.data
	prompt: .asciiz "Enter a value for x : "
	result_msg: .asciiz "The result is : "

.text
main:
    li $v0, 4               
    la $a0, prompt         
    syscall
    
    li $v0, 5            
    syscall
    move $t0, $v0     	# $t0 = x
    
    # Calculation
    mul $t1, $t0, $t0      
    li $t2, 5              
    mul $t1, $t1, $t2	# $t1 = 5 * x^2
    
    li $t2, 2               
    mul $t2, $t0, $t2    # $t2 = 2 * x
    
    add $t1, $t1, $t2      
    li $t2, 3             
    add $t1, $t1, $t2      
 
    li $v0, 4               
    la $a0, result_msg     
    syscall

    li $v0, 1            
    move $a0, $t1           
    syscall

    li $v0, 10            
    syscall