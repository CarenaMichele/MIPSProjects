# Name and general description of program
# ----------------------------------------
# Data declarations go in this section.
.data
var1: 	.byte 'm'
var2: 	.byte 'i'
var3:	.byte 'p'
var4:   .byte 's'
var5: 	.byte 0	
.text
.globl main
.ent main
main:
    lb $t0, var1
	sub $t0, $t0, 32
	sb $t0, var1
	lb $t1, var2
	sub $t1, $t1, 32
	sb $t1, var2
	lb $t2, var3
	sub $t2, $t2, 32
	sb $t2, var3
	lb $t3, var4
	sub $t3, $t3, 32
	sb $t3, var4
	
	la $a0, var1
	li $v0, 4
	syscall
	li $v0, 10
	syscall
.end main