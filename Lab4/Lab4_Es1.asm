# Name and general description of program
# ----------------------------------------
# Data declarations go in this section.
.data
N= 20
DIM= 4*N
wVett: .space DIM

.text
.globl main
.ent main
main: 
	li $t0, 0    #contatore
	li $t1, 1
	sw $t1, wVett($t0)
	addi $t0, $t0, 4
	li $t2, 1
	sw $t2, wVett($t0)
	addi $t0, $t0, 4
ciclo:
	add $t3, $t1, $t2
	sw $t3, wVett($t0)
	move $t1, $t2
	move $t2, $t3
	beq $t0, DIM, fine
	addi $t0, $t0, 4
	j ciclo
fine:
	li $v0, 10
	syscall
.end main