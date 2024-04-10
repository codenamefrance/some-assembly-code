        .data
wVett:  .word   5,  7,  3,  4  # lo alloca direttamente lui di 4 elementi
wResult:  .space    4 # alloco 4 byte di spazio (vuoto)

    .text
    .globl main
    .ent main
main:   

    # Useremo $t1 come counter = 0
    li $t1, 0
    # e $t0 come puntatore per scorrere il vettore
    la $t0, wVett

    # Versione (I) - Brutale, sommo "a mano"

    lw $t2, ($t0)
    add $t1, $t1, $t2
    # Incremento di 4 byte il puntatore
    add $t0, $t0, 4

    lw $t2, ($t0)
    add $t1, $t1, $t2
    add $t0, $t0, 4

    lw $t2, ($t0)
    add $t1, $t1, $t2
    add $t0, $t0, 4

    lw $t2, ($t0)
    add $t1, $t1, $t2

    la $t0, wResult
    sw $t1, ($t0)

    li $v0, 10
    syscall
.end main