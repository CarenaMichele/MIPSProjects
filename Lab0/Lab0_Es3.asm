# Name and general description of program
# ----------------------------------------
# Data declarations go in this section.
.data
wOpd1: 	.word 10
wOpd2:	.word 24
wResult: .space 4
.text
.globl main
.ent main
main:
    lw $t1, wOpd1
	lw $t2, wOpd2
	add $t0,$t1,$t2
	sw $t0, wResult
	li $v0, 10
	syscall
.end main