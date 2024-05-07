# Sum all array's elements and save result in $s5
    .data 
        vettore: .word 1, 2, 3, 4, 5

    .text
    .globl main
    .ent main

    main:

        addi $t0, $0, 0  # i
        addi $t1, $0, 5  # maxI
        la $s0, vettore
        addi $s5, $0, 0

    loop:
        slt $t2, $t0, $t1   # is t0<t1? 
        beq $t2, $0, end    # if 0 means that t0 is not < t1 -> t0=t1 end of array

        sll $t3, $t0, 2     # t3 = i * 4 (byte offset)
        add $t3, $t3, $s0   # t3 = i * 4 (offset) + base_address

        lw $s1, 0($t3)      # get data
        # -----
        # While body
        add $s5, $s5, $s1
        # ----
        sw $s1, 0($t3)      # store data

        addi $t0, $t0, 1
        j loop
    end:
        li $v0, 10
        syscall
    .end main
