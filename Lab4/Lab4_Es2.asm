.data
opa: 	.word 2043
opb: 	.word 5
res:	.space 4
stringaIn: .asciiz "inserisci un intero (0-3) per eseguire l'operazione==>"
tab: 	.word somma, sottrazione, moltiplic, divisione
stringaOut: .asciiz "il risultato è==>"
.text
.globl main
.ent main
main:
	li $t0, 4
	la $a0, stringaIn
	li $v0, 4
	syscall
	li $v0, 5
	syscall
	lw $t1, opa
	lw $t2, opb
	mul $t0, $v0, $t0
	lw $t4, tab($t0)
	jr $t4
somma:
	add $t3,$t1,$t2
	j fine
sottrazione:
	sub $t3,$t1,$t2
	j fine
moltiplic:
	mul $t3,$t1,$t2
	j fine
divisione:	
	div $t3,$t1,$t2
	j fine
fine:
	sw $t3, res
	la $a0, stringaOut
	li $v0, 4
	syscall
	move $a0, $t3
	li $v0, 1
	syscall
	li $v0, 10
	syscall
.end main