# Name and general description of program
# ----------------------------------------
# Data declarations go in this section.
.data
op1: 	.byte 150
op2: 	.byte 100

.text
.globl main
.ent main
main:
	lbu $t1, op1
	lb $t2, op2
	add $t0, $t1, $t2
	move $a0, $t0
    li $v0, 1
	syscall
	li $v0, 10
	syscall
.end main