DIM=5
.data
vet1:	.word 56, 12, 98, 129, 58
vet2: 	.word 1, 0, 245, 129, 12
risultato: 	.space 4*DIM
.text
.globl main
.ent main
main:
	subu $sp, $sp, 4
	sw $ra, ($sp)
	la $a0, vet1
	la $a1, vet2
	la $a2, risultato
	li $a3, DIM
	jal calcolaDistanzaH
	lw $ra, ($sp)
	addiu $sp, $sp, 4
	jr $ra
.end main
.ent calcolaDistanzaH
calcolaDistanzaH:
	li $t7,0
cicloIn:
	beq $t7,$a3,fine
	lw $t0, ($a0)
	lw $t1, ($a1)
	li $t5, 0            #contatore
	li $t6, 0
	xor $t2, $t0, $t1    #sequenza di bit a 1 pari alle diff tra i due valori
	li $t3, 1            #bit mascherato
hamming:
	and $t4, $t2, $t3    #per vedere se l'ultimo bit è pari a 1
	beq $t4, 0, next
	addiu $t5, $t5, 1
next:
	sll $t3, $t3, 1
	addiu $t6, $t6, 1   #quando arriva a 32 finisce il ciclo di quella parola
	bne $t6,32,hamming
	
	sw $t5, ($a2)
	addiu $a2, $a2, 4
	addiu $a0, $a0, 4
	addiu $a1, $a1, 4
	addiu $t7, $t7, 1
	j cicloIn
fine:
	jr $ra
.end calcolaDistanzaH