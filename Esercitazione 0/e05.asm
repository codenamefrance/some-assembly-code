    .data
        vett: .word 1, 2, 3, 4, 5  # expect 15
        result: .word 0
    .text
    .globl main
    .ent main

    main: 
        la $t1, vett
        and $t3, $0, $0 # Inizializzo il registro t3 a 000... i=0
        and $t4, $0, $0 # idem sopra

    loop: 
        lw $t0, ($t1) # Carico elemento del vettore
        add $t4, $t4, $t0
        addi $t3, $t3, 1 # i++
        addi $t1, $t1, 4 # sposto il puntatore di 4 byte
        bne $t3, 5, loop # finchè t3 != 5 ripeti loop

        la $t0, result
        sw $t4, ($t0)
        
        li $v0, 10 
        syscall

    .end main