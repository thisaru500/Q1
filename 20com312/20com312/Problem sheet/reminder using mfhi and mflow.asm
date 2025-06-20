.data
	prompt_x: .asciiz "Enter a value for x: "
	prompt_y: .asciiz "Enter a value for y: "
	result_msg: .asciiz "The remainder is: "

.text
main:
   
    li $v0, 4               
    la $a0, prompt_x         
    syscall

    li $v0, 5               
    syscall
    move $t0, $v0           # $t0 = x
    
    li $v0, 4               
    la $a0, prompt_y       
    syscall

    li $v0, 5               
    syscall
    move $t1, $v0           # $t1 = y

    div $t0, $t1            
    mfhi $t2                
    
    li $v0, 4                
    la $a0, result_msg     
    syscall

    li $v0, 1              
    move $a0, $t2           
    syscall
   
    li $v0, 10            
    syscall

