.data
	prompt_miles:    .asciiz "Enter the number of miles driven: "
	prompt_gallons:  .asciiz "Enter the number of gallons used: "
	output_msg:      .asciiz "Your mpg = "

	miles:     .word 0     
	gallons:   .word 0  
	mpg:       .word 0     

.text
main:
    li $v0, 4
    la $a0, prompt_miles
    syscall

    li $v0, 5
    syscall
    sw $v0, miles       

    li $v0, 4
    la $a0, prompt_gallons
    syscall

    li $v0, 5
    syscall
    sw $v0, gallons  

    # Load values from memory
    lw $t0, miles
    lw $t1, gallons

    # mpg = miles / gallons
    div $t0, $t1
    mflo $t2
    sw $t2, mpg          # store result in memory

    li $v0, 4
    la $a0, output_msg
    syscall

    lw $a0, mpg
    li $v0, 1
    syscall

    li $v0, 10
    syscall
