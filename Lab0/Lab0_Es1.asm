# Name and general description of program
# ----------------------------------------
# Data declarations go in this section.
.data
opd1:	.word 10
opd2: 	.word 0xDC
.text
.globl main
.ent main
main:
    lw $t0, opd1
	lw $s0, opd2
	li $v0, 10
	syscall
.end main