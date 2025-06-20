.data
	prompt_miles:    .asciiz "Enter the number of miles driven: "
	prompt_gallons:  .asciiz "Enter the number of gallons used: "
	output_msg:      .asciiz "Your mpg = "

.text
main:
    li $v0, 4                 
    la $a0, prompt_miles     
    syscall

    li $v0, 5                 
    syscall
    move $t0, $v0             # $t0 = miles

    li $v0, 4
    la $a0, prompt_gallons
    syscall

    li $v0, 5
    syscall
    move $t1, $v0             # $t1 = gallons


    # Calculate mpg = miles / gallons
    div $t0, $t1              
    mflo $t2                  

    # Output result
    li $v0, 4
    la $a0, output_msg
    syscall

    li $v0, 1                 
    move $a0, $t2             
    syscall

    li $v0, 10               
    syscall
