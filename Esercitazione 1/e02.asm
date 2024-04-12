
    .data
    DIM=4
    var1: .byte 'm'
    var2: .byte 'i'
    var3: .byte 'p'
    var4: .byte 's'
    var5: .byte 0


    
    .text
    .globl main
    .ent main
    main:
                                        # I know I have 4 bytes in memory that are contigous
    li $t0, 0                           # Counter
    la $t1, var1                        # Load first char's pointer

    loop:                               # Convert everything to caps
        lb $t2, ($t1)
        sub $t3, $t2, 32                # a -> A removing 32
        sb $t3, ($t1)                   # Save new char in-place

        addi $t0, 1
        addi $t1, 1
        bne $t0, DIM, loop


    la $a0, var1                        # Recall the starting point of string
    li $v0, 4
    syscall


    li $v0, 10
    syscall
    .end main