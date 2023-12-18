NUM=5
DIM=NUM*4
ARROTONDA=1
SCONTO=30
.data
prezzi: .word 39, 1880, 2394, 1000, 1590 
prezziScontati: .space DIM
totSconto: .space 4
.text
.globl main
.ent main
main:
	subu $sp, $sp, 4
	sw $ra, ($sp)
	
	la $a0, prezzi
	la $a1, prezziScontati
	li $a2, NUM
	li $a3, SCONTO
	li $t0, ARROTONDA
	subu $sp, $sp, 4
	sw $t0, ($sp)
	jal calcola_sconto
	sw $v0, totSconto
	lw $t0, ($sp)
	lw $ra, 4($sp)
	addu $sp, $sp, 8
	jr $ra
.end main
.ent calcola_sconto
calcola_sconto:
	lw $t0, ($sp)
	li $t9, 0
ciclo:
	lw $t1, ($a0)
	li $t2, 100
	mult $a3, $t1
	mflo $t4
	divu $t4, $t2    #calcolo riduzione per SCONTO
	mfhi $t3   	 		#resto divisione
	mflo $t4
	beq $t0, 1, funArrotonda
noArr:
	subu $t1, $t1, $t4 
	sw $t1, ($a0)
	b next
	
funArrotonda:
	bge $t3, 5, arr   #se il resto > 5 verifico se l'arrotondamento = 1 o = 0
	j noArr
arr:
	addiu $t4, $t4, 1
	subu $t1, $t1, $t4
	sw $t1, ($a0)
next: 
	addu $t9, $t9, $t4
	addiu $a0, $a0, 4
	subu $a2, $a2, 1
	bnez $a2, ciclo
	
	move $v0, $t9
	jr $ra
.end calcola_sconto