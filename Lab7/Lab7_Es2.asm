.data
c0: .word 5
.text
.globl main
.ent main
main:
	lw $a0, c0
	subu $sp, $sp, 4
	sw $ra, ($sp)
	jal calcolaSuccessivo
	lw $ra, ($sp)
	addiu $sp, $sp, 4
	move $a0, $v0
	li $v0, 1
	syscall
	jr $ra
.end main

.ent calcolaSuccessivo
calcolaSuccessivo:
	and $t0, $a0, 1
	beq $t0, 0, pari
	mul $v0, $a0, 3
	add $v0, $v0, 1
	j fine
pari:
	div $v0, $a0, 2
fine:
	jr $ra
.end calcolaSuccessivo
