.data
input: .asciiz "introduci numero==>"
output: .asciiz "numero elementi sequenza==>"
.text
.globl main
.ent main
main:
	subu $sp, $sp, 4
	sw $ra, ($sp)
	la $a0, input
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	move $a0, $v0
	jal sequenzaDiCollatz
	move $t0, $v0
	la $a0, output
	li $v0, 4
	syscall
	move $a0, $t0
	li $v0, 1
	syscall
	lw $ra, ($sp)
	addiu $sp, $sp, 4
	jr $ra
.end main 

.ent sequenzaDiCollatz
sequenzaDiCollatz:
	subu $sp, $sp, 8
	sw $ra, 4($sp)
	sw $s0, ($sp)
	li $s0, 1
ciclo:
	beq $a0, 1, fineCiclo
	jal calcolaSuccessivo
	move $a0, $v0
	addi $s0, $s0, 1
	b ciclo
fineCiclo:
	move $v0, $s0
	lw $s0, ($sp)
	lw $ra, 4($sp)
	addiu $sp, $sp, 8
	jr $ra
.end sequenzaDiCollatz

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
