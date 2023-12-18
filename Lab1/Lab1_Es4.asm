# Name and general description of program
# ----------------------------------------
# Data declarations go in this section.
.data
valI: .asciiz "inserire intero==>"
.text
.globl main
.ent main
main:
	la $a0, valI
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	move $t1, $v0
	 
	la $a0, valI
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	move $t2, $v0
	
scambio:
	add $t1, $t1, $t2
	sub $t2, $t1, $t2
	sub $t1, $t1, $t2
	
	li $v0, 10
	syscall
.end main