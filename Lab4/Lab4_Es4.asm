.data
NUM=10
DIM=4*NUM
x: 	.word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
y: 	.word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
matrice: .space NUM*DIM
overflowString: .asciiz "overflow"
.text
.globl main
.ent main
main:
	li $t5, 0
	li $t0, 0
cicloRiga:
	li $t1, 0
	lw $t2, x($t0)
cicloColonna:
	lw $t3, y($t1)
	mult $t2, $t3
	mfhi $t4
	beq $t4, $0, noOverflow
	bne $t4, 0xFFFFFFFF, overflow
noOverflow:
	mflo $t4
	sw $t4, matrice($t5)
	addi $t5, $t5, 4
	addi $t1, $t1, 4
	blt $t1, DIM, cicloColonna
	addi $t0, $t0, 4
	blt $t0, DIM, cicloRiga
	j fine
overflow:
	la $a0, overflowString
	li $v0, 4
	syscall
fine:
	li $v0, 10
	syscall
.end main