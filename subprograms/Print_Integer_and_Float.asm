# 	Write subprograms for the following: 
#	Get and print integer 
#	Get and print float 
# 	Save this file as numLib.asm 
 
.data 
	prompt_int: .asciiz "Enter an integer: " 
	prompt_float: .asciiz "Enter a float: " 
	newline: .asciiz "\n" 

.text 
main: 
	li $v0, 4 
    la $a0, prompt_int                          
    syscall 
    
    jal read_integer           
    move $a0, $v0   
               
    jal print_integer    
    
    li $v0, 4
    la $a0, newline
    syscall      
 
 	li $v0, 4  
    la $a0, prompt_float                       
    syscall 
    
    jal read_float             
    mov.s $f12, $f0   
             
    jal print_float            
 
    li $v0, 10                
    syscall 
    
    # ------------------ Sub programs ----------------------
 
	read_integer: 
    		li $v0, 5                  
    		syscall 
    		jr $ra                     
 
	print_integer: 
    		li $v0, 1                 
    		syscall 
    		la $a0, newline           
    		li $v0, 4                  
    		syscall 
    		jr $ra                     
 
	read_float: 
    		li $v0, 6                 
    		syscall 
    		jr $ra                    
 
	print_float: 
		li $v0, 2                 
		syscall 
		la $a0, newline            
		li $v0, 4                  
		syscall 
		jr $ra
