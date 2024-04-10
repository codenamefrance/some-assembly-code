    .data
result: .space 4 # mi aspetto 230
val1: .word 0xDC # 200
val2: .word 10 # 10

    .text
    .globl main
    .ent main
main:
    la $t0, val1
    lw $t1, ($t0)
    la $t0, val2 
    lw $t2, ($t0)

    li $v0 10
    syscall
.end main
