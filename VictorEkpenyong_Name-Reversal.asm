# Victor Ekpenyong
# Assembly Language
# Name Reversal
	
	.data
	
prompt:	.asciiz "Enter your name (FIRST LAST): "
reverse: .asciiz " reversed is "
buf:	.space 100
comma: 	.asciiz ", "	
	
	.text
	
main:
	# User Prompted for name
	li $v0, 4
	la $a0, prompt
	syscall
	
	# User enters name
	li $v0, 8
	la $a0, buf
	li $a1, 100
	syscall
	
	# Temps loaded with user input
	la $t0, buf
	la $t1, buf
	la $t2, buf
	
	
	# First character of name printed
	lbu $a0, 0($t0)
	li $v0, 11
	syscall
	
PrintName:
	# Loop which prints each character of name and ends when \n is found
	addiu $t0, $t0, 1
	lbu $a0, 0($t0)
	beq $a0, '\n', ReversePrompt
	li $v0, 11
	syscall
	j PrintName
	
        
ReversePrompt:
	# Reversed is text printed
	li $v0, 4
	la $a0, reverse
	syscall
	
	
	
FirstSpace:
	# Loop which looks for and ends when space is found
	addiu $t1, $t1, 1
	lbu $a0, 0($t1)
	bne $a0, ' ', FirstSpace
	
	
LNamePrint:
	# Loop which prints each character of name and ends when \n is found
	# Last name being printed 	
	addiu $t1, $t1, 1
	lbu $a0, 0($t1)
	beq $a0, '\n', AddComma
	li $v0, 11
	syscall
	j LNamePrint
	
AddComma:
	# Comma added after last name	
	li $v0, 4
	la $a0, comma
	syscall

	# First letter of user inputed name printed
	lbu $a0, 0($t2)
	li $v0, 11
	syscall
	
	
FNamePrint:
	# Loop which prints each character of name and ends when ' ' is found	
	# First name being printed
	addiu $t2, $t2, 1
	lbu $a0, 0($t2)
	li $v0, 11
	syscall
	bne $a0, ' ', FNamePrint

	# Exit
	li $v0, 10
	syscall


