.data
.text
.globl main
.ent main
main: 
	subu $sp, $sp, 4
	sw $ra, ($sp)
	jal stampaTriangolo
	jal stampaQuadrato
	
	lw $ra, ($sp)
	addiu $sp, $sp, 4
	
	li $v0, 10
	syscall
.end main

.ent stampaTriangolo
stampaTriangolo:
	li $t0, 0
	li $t1, 1
	li $t2, 0
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
		bne $t0, 8, ciclo
	jr $ra
.end stampaTriangolo

.ent stampaQuadrato
stampaQuadrato:
	li $t0, 0
	li $t1, 0
	for1:
		la $a0, '*'
		li $v0, 11
		syscall
	
		add $t1,$t1,1
		bne $t1, 8, for1 
		li $t1, 0
		li $a0 '\n'
		syscall
		add $t0,$t0,1
		bne $t0, 8, for1
	jr $ra
	
	
.end stampaQuadrato