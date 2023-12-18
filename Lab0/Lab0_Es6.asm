# Name and general description of program
# ----------------------------------------
# Data declarations go in this section.
.data
DIM = 5
wVett:	.space 20
stringIn: .asciiz "inserisci un valore: "
stringOut: .asciiz "vettore finale: "
.text
.globl main
.ent main
main:
li $t3, 0
li $t0, 0
ciclo:
	la $a0, stringIn
	li $v0, 4
	syscall
	li $v0, 5
	syscall 
	sw $v0, wVett($t0)
	add $t3, $t3, 1
	addi $t0, $t0, 4
	bne $t3, DIM, ciclo

	li $t3, 0
	li $t0, 0
	la $a0, stringOut
	li $v0, 4
	syscall
	
cicloScritt:
	lw $a0, wVett($t0) 
	li $v0, 1
	syscall
	li $a0, 32
	li $v0, 11  
	syscall
	addi $t0, $t0, 4
	addi $t3, $t3, 1
	bne $t3, DIM, cicloScritt

	li $v0, 10
	syscall
.end main