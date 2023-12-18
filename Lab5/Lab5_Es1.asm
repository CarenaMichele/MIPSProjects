.data
var: .word 3141592653
.text
.globl main
.ent main
main:
	li $t0, 0
	li $t1, 10
	lw $t2, var
divisioni: 
	div $t2, $t2, $t1
	mflo $t2   #nuovo dividendo
	mfhi $t5  #resto
	addu $t0, $t0, 1
	subu $sp, $sp, 4
	sw $t5, ($sp)
	bne $t2, 0, divisioni
stampa: 
	lw $a0, ($sp)
	addu $a0, $a0, '0'
	li $v0, 11
	syscall
	addu $sp, $sp, 4
	subu $t0, $t0, 1
	bne $t0, 0, stampa
	li $v0, 10
	syscall
.end main