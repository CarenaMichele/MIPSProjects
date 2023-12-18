# Name and general description of program
# ----------------------------------------
# Data declarations go in this section.
.data
DIM = 4
wVett:	.space 20
wRes: .space 4
stringaIn: .asciiz "inserisci valori\n"
stringaOut: .asciiz "il minimo è:"
.text
.globl main
.ent main
main:
	li $t3, 0
	la $t0, wVett
	
	la $a0, stringaIn
	li $v0, 4
	syscall
	
ciclo:
	li $v0, 5
	syscall 
	sw $v0, ($t0)
	beq $t3, DIM, calc
	addi $t3, $t3, 1
	addi $t0, $t0, 4
	j ciclo
calc:
	la $t0, wVett
	li $t3, 0
	lw $t1, ($t0)
	addi $t0, $t0, 4
loop_min:	
	beq $t3, DIM, print
	lw $t4, ($t0)
	blt $t4,$t1, min
cont:
	addi $t3, $t3, 1
	addi $t0, $t0, 4
	j loop_min	
min: 
	move $t1, $t4
	j cont
print:
	la $a0, stringaOut
	li $v0, 4
	syscall
	move $a0, $t1
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
.end main