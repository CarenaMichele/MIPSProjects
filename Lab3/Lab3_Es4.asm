# Name and general description of program
# ----------------------------------------
# Data declarations go in this section.
.data
DIM: .word 4
stringaIn: .asciiz "inserisci valore:"
stringaOut: .asciiz "la media è:"
.text
.globl main
.ent main
main:
	li $t0, 0
	lw $t4, DIM
ciclo:
	la $a0, stringaIn
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	add $t1, $t1, $v0
	addi $t0, $t0, 1
	bne $t0, $t4, ciclo
	div $t2, $t1, $t0
	la $a0, stringaOut
	li $v0, 4
	syscall
	move $a0, $t2
	li $v0, 1
	syscall
	li $v0, 10
	syscall
.end main