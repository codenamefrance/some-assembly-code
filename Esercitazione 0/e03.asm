        .data
wOpd1:   .word     16
wOpd2:   .word     24
wResult:  .space    4 # alloco 4 byte di spazio (vuoto)
# bVar se lavoro sui byte (come indirizzamento) - calcoli per spostare
#   puntatori -> byte (da una parola all'altra, +4 byte)

    .text
    .globl main
    .ent main

# la add lavora sui REGISTRI, però ora sono ancora nelle variabili
# metto sui registri, sommo, e poi con sw rimetto da registro -> memoria
main:   
    la $t0, wOpd1
    lw $t1, ($t0)
    la $t0, wOpd2
    lw $t2, ($t0)
    add $t3, $t1, $t2

    la $t0, wResult
    sw $t3, ($t0)

    li $v0, 10
    syscall
.end main