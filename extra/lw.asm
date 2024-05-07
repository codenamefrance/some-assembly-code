    .data
        parola: .word 10
    .text
    .globl main

    main:   
    
    lw $t0, parola  # 10 is stored in $t0

    li $v0, 10
    syscall

    .end main