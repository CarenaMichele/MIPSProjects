.data
input_prompt: .asciiz "Inserire numero: "
overflow_print: .asciiz "Overflow!"
prompt: .asciiz "Il numero inserito è "

.text

.globl main
.ent main

main:

li $t8 0x1  #accumulatore
li $t7 0x0  #input_utente totale

li $v0 4
la $a0 input_prompt
syscall

input_chars:
    li $v0 12   #input char
    syscall

    move $t0 $v0    #cifra attuale


    beq $t0 0xA out    #char inserito '\n'

    sge $t1 $t0 0x30 #se cifra >= '0'
    sle $t2 $t0 0x39 #se cifra <= '9'

    and $t1 $t1 $t2  #cifra between '0' and '9'
    beq $t1 0 out

    subu $t0 $t0 '0'


    multu $t0 $t8   #cifra * accumulatore
    mfhi $t6    #overflow della moltiplicazione
    mflo $t3    #risultato 32 bit moltiplicazione

    bne $t6 $zero out   #se la cifra attuale causa overflow

    add $t7 $t7 $t3     #aggiunta al totale
    
    li $t6 0xA

    multu $t8 $t6   #accumulatore*=10



    mflo $t8    #nuovo accumulatore
    mfhi $t5    #controllo overflow su accumulatore

    bne $t5 $zero out   #se l'accumulatore è in overflow

    j input_chars
out:
    li $v0 12
    li $a0 0xA  #print newline
    syscall

    li $v0 4
    la $a0 prompt   #print str
    syscall

    li $v0 1
    move $a0 $t7    #print numero
    syscall

    li $v0 10
    syscall

.end main