# Name and general description of program
# ----------------------------------------
# Data declarations go in this section.
.data
messageInput: .asciiz "Inserisci un numero: "
messageOutput: .asciiz "\nIl numero è troppo grande "
messageError: .asciiz "\nL'input non e' un numero valido."
messageOk: .asciiz "L'input e' corretto."
messageEmpty: .asciiz "Non e' stato inserito nessun numero!"
.text
.globl main
.ent main
main: 
	la $a0, messageInput
	li $v0, 4
	syscall
	move $t0, $0 #contatore numero di caratteri letti
	li $t1, 0   #registro accumulatore
	li $t5, 10
loop: 
	li $v0, 12 # lettura di un carattere
	syscall
	beq $v0, '\n', exitLoop
	blt $v0, '0', notANumber
	bgt $v0, '9', notANumber
	addi $t0, $t0, 1
	sub $t2, $v0, '0'
	multu $t1, $t5
	mfhi $t1
	bne $t1, $0, overflow
	mflo $t1
	addu $t3, $t1, $t2
	bltu $t3, $t1, overflow
	move $t1, $t3
	b loop
exitLoop: 
	beq $t0, 0, noInput
	la $a0, messageOk
	b printMessage
noInput: 
	la $a0, messageEmpty
	b printMessage
notANumber: 
	la $a0, messageError
overflow:
	la $a0, messageOutput
printMessage: 
	li $v0, 4
	syscall
	move $a0, $t3
	li $v0, 1
	syscall
	li $v0, 10
	syscall
.end main