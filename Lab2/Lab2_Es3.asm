# Name and general description of program
# ----------------------------------------
# Data declarations go in this section.
.data
var1: 	.word 1249
var2: 	.word 2198
var3: 	.word -968
.text
.globl main
.ent main
main:
	lw $t0, var1
	lw $t1, var2
	lw $t2, var3
	
    bgt $t0, $t1, swap1
proc2:
	bgt $t0, $t2, swap2
proc3:
	bgt $t1, $t2, swap3
    j fine
swap1: 
     move $t3, $t1
	 move $t1, $t0
	 move $t0, $t3
	 j proc2
swap2: 
     move $t3, $t2
	 move $t2, $t0
	 move $t0, $t3
	 j proc3
swap3: 
     move $t3, $t2
	 move $t2, $t1
	 move $t1, $t3
fine:
	move $a0, $t0
	li $v0, 1
	syscall
	li $a0, 32
	li $v0, 11  
	syscall
	move $a0, $t1
	li $v0, 1
	syscall
	li $a0, 32
	li $v0, 11  
	syscall
	move $a0, $t2
	li $v0, 1
	syscall
	li $v0, 10
	syscall
.end main