.data
n=12
k=2
combinazioni: .space 4
.text
.globl main
.ent main
main: 
	li $a0, n
	li $a1, k
	jal combina
	li $v0, 10
	syscall
.end main
.ent massimo
combina:
	move $t0, $a0
	move $t1, $a1
	li $t2, 1
	denominatore:
		loop1:
			mul $t2, $t2, $t1
			subu $t1, $t1, 1
			bne $t1,0,loop1
		move $t1, $t2
	
	numeratore:
		li $t3, 1
		subu $t4, $t0, $a1
		addi $t4, $t4, 1
		subu $t5, $t4, 1
		loop2:
			mul $t3, $t3, $t0
			subu $t0, $t0, 1
			bne $t0,$t5,loop2
		move $t0, $t3
	div $t0, $t1
	mflo $v0
	jr $ra
.end combina