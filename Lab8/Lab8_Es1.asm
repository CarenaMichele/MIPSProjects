.data
insCosto: .asciiz "inserisci costo parcheggio==>"
insMinutiCosto: .asciiz "inserisci periodo in minuti==>"
strOuput: .asciiz "costo totale==>"
ora_in: 	.byte 12, 47
ora_out: 	.byte 18, 14
.text
.globl main
.ent main
main:
	subu $sp, $sp, 4
	sw $ra, ($sp)
	
	la $a0, insCosto
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	move $a2, $v0
	la $a0, insMinutiCosto
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	move $a3, $v0
	
	la $a0, ora_in
	la $a1, ora_out
	
	jal costoParcheggio
	move $t1, $v0
	la $a0, strOuput
	li $v0, 4
	syscall
	move $a0, $t1
	li $v0, 1
	syscall
	lw $ra, ($sp)
	addiu $sp, $sp, 4
	jr $ra
.end main

.ent costoParcheggio
costoParcheggio:
	lbu $t0, 0($a0)
	lbu $t1, 1($a0)
	
	lbu $t2, 0($a1)
	lbu $t3, 1($a1)
	
	li $t4, 60
	
	multu $t0, $t4
	mflo $t0
	multu $t2, $t4
	mflo $t2
	addu $t0, $t0, $t1
	addu $t2, $t2, $t3
	subu $t0, $t2, $t0   #minuti totali parcheggiati
	divu $t0, $t0, $a3   #periodi esatti tempo
	mflo $t0
	mfhi $t5
	beq $t5,0, next
	addiu $t0, $t0, 1
next:
	multu $t0, $a2
	mflo $v0
	jr $ra
	
.end costoParcheggio