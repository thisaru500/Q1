.text
#set sentinel value (prompt the user for input).
la $a0, prompt
li $v0, 4
syscall
li $v0, 5
syscall
move $s0, $v0
start_loop:
sne $t1, $s0, -1
beqz $t1, end_loop

la $a0, output
li $v0, 4
syscall
move $a0, $s0
li $v0, 1
syscall
la $a0, prompt
li $v0, 4
syscall
li $v0, 5
syscall
move $s0, $v0
b start_loop
end_loop:
li $v0,10
syscall
.data
prompt: .asciiz "\nEnter an integer, -1 to stop: "
output: .asciiz "\nYou entered: " 