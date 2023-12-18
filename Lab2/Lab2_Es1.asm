# Name and general description of program
# ----------------------------------------
# Data declarations go in this section.
.data
messageIn: .asciiz "inserisci un intero positivo:"
messageDispari: .asciiz "il valore inserito è dispari"
messagePari: .asciiz "il valore inserito è pari"
.text
.globl main
.ent main
main:
   la $a0, messageIn
   li $v0, 4
   syscall
   li $v0, 5
   syscall
   move $t0, $v0
   and $t0, $t0, 1
   bne $t0, 0, dispari
   la $a0, messagePari
   li $v0, 4
   syscall
   j fine
dispari:   
   la $a0, messageDispari
   li $v0, 4
   syscall
fine:  
   li $v0, 10
   syscall
.end main