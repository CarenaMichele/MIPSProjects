DIM= 6
.data
anni: .word 1945, 2008, 1800, 2006, 1748, 1600
risultato: .space DIM
.text
.globl main
.ent main
main:
	sub $sp, 4
	sw $ra, ($sp)
	
	la $a0, anni
	la $a1, risultato
	li $a2, DIM
	
	jal bisestile
	
	li $t1, DIM
	la $t2, risultato
	
ciclo_stampa:
	li $v0, 1
	lbu $a0, ($t2)
	syscall
	addiu $t2, $t2, 1
	subu $t1, $t1, 1
	bnez $t1, ciclo_stampa
	lw $ra, ($sp)
	addiu $sp, $sp, 4
	jr $ra
.end main
.ent bisestile
	
bisestile:
ciclo:
	sb $0, ($a1)
	lw $t0, ($a0)
	li $t1, 100
	divu $t0, $t1
	mfhi $t1	
	bnez $t1, nodiv100
	li $t1, 400
	divu $t0, $t1
	mfhi $t1
	bne $t1, 0, next
	li $t1, 1
	sb $t1,($a1)
	b next
nodiv100:
	li $t1, 4
	div $t0, $t0, $t1
	mfhi $t1
	bnez $t1,next
	li $t1, 1
	sb $t1,($a1)
next:	
	addiu $a0, $a0, 4
	addiu $a1, $a1, 1
	subu $a2, $a2, 1
	bnez $a2, ciclo

	jr $ra
.end bisestile
