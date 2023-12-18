# Name and general description of program
# ----------------------------------------
# Data declarations go in this section.
.data
messageIn: .asciiz "inserisci il primo intero positivo:"
messageIn2: .asciiz "inserisci il secondo intero positivo:"
messageError: .asciiz "il valore inserito non è rappresentabile su byte"
.text
.globl main
.ent main
main:
   la $a0, messageIn
   li $v0, 4
   syscall
   li $v0, 5
   syscall
   move $t1, $v0
   
   la $a0, messageIn2
   li $v0, 4
   syscall
   li $v0, 5
   syscall
   move $t2, $v0
   
   li $t0, 255
   bgtu $t1, $t0, errorMessage
   bgtu $t2, $t0, errorMessage
   not $t2, $t2
   and $t4, $t1, $t2
   not $t4, $t4
   not $t2, $t2
   xor $t5, $t1, $t2
   or $t6, $t4, $t5
   
   move $a0, $t6
   li $v0, 1
   syscall
   j fine
   
errorMessage:
   la $a0, messageError
   li $v0, 36
   syscall
   
fine:
   li $v0, 10
   syscall
.end main