.data
stringIN: .asciiz "inserisci la stringa==>"
mesNoPal: .asciiz "stringa non palindroma"
mesPal: .asciiz "stringa Palindroma"
.text
.globl main
.ent main
main:
	move $t0, $sp
	move $s0, $sp
	la $a0, stringIN
	li $v0, 4
	syscall
	li $t1, 0 #contatore lettere
readString:
	li $v0,12
	syscall
	beq $v0, '\n', verifica
	subu $sp, $sp, 4
	addi $t0, $t0, 1
	sb $v0, ($sp)
	b readString
verifica:
	subu $t0, $t0, 4
	lw $t2, ($t0)   
	lw $t3, ($sp)   
	addu $sp, $sp, 4
	bne $a0, $a1, noPalindromo
	addi $t0, $t0, -2
	bgt $t0, 0, verifica
	la $a0, mesPal
	b stampa
	
noPalindromo:
	la $a0, mesNoPal
	b stampa
		
stampa:
	li $v0, 4
	syscall
	move $sp, $s0
	li $v0, 10
	syscall
.end main