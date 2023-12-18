DIM = 3
DIM_RIGA = DIM * 4
.data
mat1: .word 4, -45, 15565, 6458, 4531, 124, -548, 2124, 31000
mat2: .word 6, -5421, -547, -99, 4531, 1456, 4592, 118, 31999
indice: .word 2
vet_out: .space DIM_RIGA
.text
.globl main
.ent main
main:
la $a0, mat1
la $a1, mat2
la $a2, vet_out
li $a3, DIM
subu $sp, $sp, 4
lw $t0, indice
sw $t0, ($sp)
jal ProceduraVariazione
lw $t0, ($sp)
addu $sp, $sp, 4
li $v0, 10
syscall
.end main

.ent ProceduraVariazione
ProceduraVariazione:
	lw $t0, ($sp)
	li $t3, 100
	
	sll $t1, $a3, 2
	mul $t2, $t0, $t1
	addu $a0, $a0, $t2    #ind. primo elemento matrice 
	
	mul $t2, $t0, 4
	addu $a1, $a1, $t2    #ind. secondo elemento matrice
	
	li $t5, 0             #contatore
ciclo:
	beq $t5, $a3, fine
	lw $t1, ($a0)
	lw $t2, ($a1)
	
	subu $t2, $t2, $t1
	multu $t2, $t3
	mflo $t2
	div $t2, $t1
	mflo $t2      #variazione
	
	sw $t2, ($a2)
	addiu $a0, $a0, 4
	addiu $a1, $a1, 12
	addiu $a2, $a2, 4
	addi $t5, $t5, 1
	j ciclo
fine:
	jr $ra
.end ProceduraVariazione