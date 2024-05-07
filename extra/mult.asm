    .text
    .globl main
    .ent main

    main:   
            addi $s0, $0, 4
            sll $s0, $s0, 2
            li $v0, 10
            syscall
    .end main