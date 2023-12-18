.data
NUMRIG=4
NUMCOL=6
DIMRIG=4*NUMCOL
matrice: 	.word 154, 123, 109, 86, 4, 0, 412, -23, -231, 9, 50, 0, 123, -24, 12, 55, -45, 0, 0, 0, 0, 0, 0, 0
overflowString: .asciiz "overflow"
.text
.globl main
.ent main
main:
	li $t2, 1
	li $t3, 1
	li $t0, 0
cicloRighe:
	lw $t5, matrice($t0)
	add $t4, $t4, $t5
	addi $t0, $t0, 4
	addi $t2, $t2, 1
	blt $t2, NUMCOL, cicloRighe
	sw $t4, matrice($t0)
	li $t2, 1
	li $t4, 0
	addi $t3, $t3, 1
	addi $t0, $t0, 4
	blt $t3, NUMRIG, cicloRighe	

	li $t0, 0
	li $t2, 1
	li $t3, 1
cicloColonne:
	lw $t5, matrice($t0)
	add $t4, $t4, $t5
	addi $t0, $t0, 24
	addi $t3, $t3, 1
	blt $t3, NUMRIG, cicloColonne
	sw $t4, matrice($t0)
	li $t3, 1
	li $t4, 0
	addi $t2, $t2, 1
	addi $t0, $t0, -68
	ble $t2, NUMCOL, cicloColonne

	li $v0, 10
	syscall
.end main