.data
wVett:   .word 5, 7, 3, 4
wResult: .space 4
.text
.globl main
.ent main
main:
	la $t1,wVett
	and $t2,$0,$0
	lw $t0,($t1)
	add $t2, $t2, $t0
	addi $t1,$t1,4
	lw $t0,($t1)
	add $t2, $t2, $t0
	addi $t1,$t1,4
	lw $t0,($t1)
	add $t2, $t2, $t0
	addi $t1,$t1,4
	lw $t0,($t1)
	add $t2, $t2, $t0
	sw $t2, wResult
	
	li $v0, 10
	syscall
.end main

#.data
#DIM=4
# wVett: 	.word 5, 7, 3, 4
#wResult: .space 4
#.text
#.globl main
#.ent main
#main:
	#li $t3, 0   #per somma
	#li $t0, 0   #per vettore
	#li $t2, 0   #per comparare con dim
#ciclo:
	#lw $t1, wVett($t0)
	#add $t3, $t3, $t1
	#addi $t0, $t0, 4
	#addi $t2, $t2, 1
	#bne $t2, DIM, ciclo
	#sw $t3, wResult
	#li $v0, 10
	#syscall
#.end main