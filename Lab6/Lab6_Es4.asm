.data
DIM=4
vect: .word 4, 5, 9, 2
max: .asciiz "il valore massimo è:"
.text
.globl main
.ent main
main: 
	la $a0, vect
	li $a1, DIM
	jal massimo
	move $t0, $v0
	la $a0, max
	li $v0, 4
	syscall
	move $a0, $t0
	li $v0, 1
	syscall
	li $v0, 10
	syscall
.end main
.ent massimo
massimo:
	move $t0, $a0
	move $t1, $a1
	lw $v0, ($t0)
	loop1:
		addi $t0, $t0, 4
		sub $t1, $t1, 1
		beq $t1,0, fine
		lw $t2, ($t0)
		bgt $t2, $v0, moveMax
		j fine
moveMax:
	move $v0, $t2
	j loop1
fine:
	jr $ra
.end massimo