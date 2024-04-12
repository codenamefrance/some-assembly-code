# (op1) = 150 -> 1001 0110   MSB a 1 -> se lavoro come numero con segno: PROBLEMA! 1 interpretato come MENO
# (op2) = 100 -> 0110 0100   MSB a 0 -> non dà problemi: posso lavorare sia in signed che unsigned

    .data 
        op1: .byte 150
        op2: .byte 100
    .text

    .globl main
    .ent main

    main:

        #lb $t0, op1            # 150 -> 106 PROBLEM
        lbu $t0, op1            # 150 -> 150 OK!

        #lb $t1, op2    
        lbu $t1, op2

        add $t3, $t0, $t1


        move $a0, $t3
        li $v0, 1
        syscall 

    li $v0, 10
    syscall
.end main