N=7
.data
c0: 	.word 4
c1: 	.word 2
c2: 	.word -5
c3: 	.word 3
.text
.globl main
.ent main
main:
	subu $sp, $sp, 4
	sw $ra, ($sp)
	
	lw $t0, c3
	lw $t1, c2
	lw $t2, c1
	lw $t3, c0
	li $t4, N
	
	mul $s1, $t1, $t1
	mul $s0, $s1, $t1
	mul $s3, $t3, $t3
	mul $s2, $s3, $t3
	mul $s5, $t0, $t0
	mul $s4, $s5, $t0
	
	add $a0, $t0, $t1
	add $a0, $a0, $t2
	add $a0, $a0, $t3
	
	mul $a1, $t0, $s0
	mul $t8, $t1, $s1
	add $a1, $a1, $t8
	mul $t8, $t2, 2
	add $a1, $a1, $t8
	add $a1, $a1, $t3
	
	mul $a2, $t0, $s2
	mul $t8, $t1, $s3
	add $a2, $a2, $t8
	mul $t8, $t2, 3
	add $a2, $a2, $t8
	add $a2, $a2, $t3
	
	mul $a3, $t0, $s4
	mul $t8, $t1, $s5
	add $a3, $a3, $t8
	mul $t8, $t2, 4
	add $a3, $a3, $t8
	add $a3, $a3, $t3
	
	subu $sp, $sp, 16
	sw $t0, 12($sp)
	sw $t1, 8($sp)
	sw $t2, 4($sp)
	sw $t3, 0($sp)
	
	subu $sp, $sp, 4
	sw $t4, ($sp)
	jal polinomio
	addi $sp, $sp, 4
	
	
	lw $t3, 0($sp)
	lw $t2, 4($sp)
	lw $t1, 8($sp)
	lw $t0, 12($sp)
	addiu $sp, $sp, 16
	
	lw $ra, ($sp)
	addiu $sp, $sp, 4
	jr $ra
	
.end main
.ent polinomio
polinomio:
	subu $fp, $sp, 4
	
	subu $sp, $sp, 12
	sw $s0, 8($sp)
	sw $s1, 4($sp)
	sw $s2, 0($sp)
	
	
	sub $t0, $a1, $a0
	sub $t1, $a2, $a1
	sub $t2, $a3, $a2
	sub $s0, $t1, $t0
	sub $s1, $t2, $t1
	sub $s2, $s1, $s0
	move $v0, $a3
	
	lw $t8, 4($fp)   #lw $t8, 12($fp)
	subu $t8, $t8 , 4
	ciclo:
		add $s1, $s1, $s2
		add $t2, $t2, $s1
		add $v0, $v0, $t2
		addi $t8,-1
		bnez $t8, ciclo  
	
	lw $s2, 0($sp)
	lw $s1, 4($sp)
	lw $s0, 8($sp)
	addiu $sp, $sp, 12
	
	jr $ra
.end polinomio