.data
parola: .asciiz "ciao"
.text
.globl main
.ent main
main: 
	la $t0, parola
	subu $sp, $sp, 4
	sw $ra, ($sp)
	for1:
		lb $a0, ($t0)
		beq $a0, 0, print 
		jal FromMinToMax
		sb $v0, ($t0)
		addi $t0, $t0, 1
		j for1
	
	
print: 
	la $a0, parola
	li $v0, 4
	syscall
fine:
	lw $ra, ($sp)
	addiu $sp, $sp, 4
	li $v0, 10
	syscall
.end main


.ent FromMinToMax
FromMinToMax:
	bgt $a0, 'z', exit
	blt $a0, 'a', exit
	subu $a0, $a0, 32
exit:
	move $v0, $a0
	jr $ra
	
.end FromMinToMax