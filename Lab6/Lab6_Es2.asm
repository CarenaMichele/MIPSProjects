.data
input: .asciiz "inserisci la dimensione del lato:"
.text
.globl main
.ent main
main: 
	la $a0, input
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	move $a0, $v0
	subu $sp, $sp, 8
	sw $a0, 4($sp)
	sw $ra, 0($sp)
	jal stampaTriangolo
	jal stampaQuadrato
	
	lw $ra, 0($sp)
	lw $a0, 4($sp)
	addiu $sp, $sp, 8
	
	li $v0, 10
	syscall
.end main

.ent stampaTriangolo
stampaTriangolo:
	li $t0, 0
	li $t1, 1
	li $t2, 0
	lw $t3, 4($sp)
	ciclo:
		la $a0, '*'
		li $v0, 11
		syscall
		
		add $t2,$t2,1
		bne $t2, $t1, ciclo 
		add $t1,$t1,1
		add $t0,$t0,1
		li $t2, 0
		li $a0 '\n'
		syscall
		bne $t0, $t3, ciclo
	jr $ra
.end stampaTriangolo

.ent stampaQuadrato
stampaQuadrato:
	li $t0, 0
	li $t1, 0
	lw $t3, 4($sp)
	for1:
		la $a0, '*'
		li $v0, 11
		syscall
	
		add $t1,$t1,1
		bne $t1, $t3, for1 
		li $t1, 0
		li $a0 '\n'
		syscall
		add $t0,$t0,1
		bne $t0, $t3, for1
	jr $ra
	
	
.end stampaQuadrato