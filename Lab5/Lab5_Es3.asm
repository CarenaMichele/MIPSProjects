.data
stringA: .asciiz "inserire a:"
stringB: .asciiz "inserire b:"
stringC: .asciiz "inserire c:"
msgReale: .asciiz "equazione produce sol. reali"
msgNonReale: .asciiz "equazione non produce sol. reali"

.text
.globl main
.ent main
main:
	la $a0, stringA
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	move $t0, $v0
	
	la $a0, stringB
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	move $t1, $v0
	
	la $a0, stringC
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	move $t2, $v0

	
	mul $t3, $t0, $t2  #calcolo delta
	mul $t3, $t3, 4
	mul $t4, $t1, $t1
	sub $t5,$t4, $t3
	#bge $t5, 0, solReale
	slt $t5, $t5, 0
	beq $t5, 0, solReale
	#blt $t5, 0, solNonReale
	slt $t5, $t5, 0
	bne $t5, 0, solNonReale
solReale:
	la $a0, msgReale
	li $v0, 4
	syscall
	j fine
solNonReale:
	la $a0, msgNonReale
	li $v0, 4
	syscall
	j fine
fine:
	li $v0, 10
	syscall
.end main