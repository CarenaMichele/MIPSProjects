# Name and general description of program
# ----------------------------------------
# Data declarations go in this section.
.data
DIM:     .word 4
wVett:   .word 5, 7, 3, 4
wResult: .space 4
.text
.globl main
.ent main
main:
	la $t0, wVett
	li $t2, 0
	lw $t3, DIM
ciclo:
	lw $t1,($t0)
	add $t2, $t2, $t1
	addi $t0, 4
	sub $t3, $t3, 1
	beq $t3, 0, fine
	j ciclo
fine:
	sw $t2, wResult
	li $v0, 10
	syscall
.end main