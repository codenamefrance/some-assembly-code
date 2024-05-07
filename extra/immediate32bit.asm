    # Load 32 bits immediate manually

    .text
    .globl main
    .ent main
    main:
    # We want to LI an immediate not representable on 16 bits, e.g. 80000 (10011100010000000, 0x13880)
    lui $t0, 0x1
    ori $a0, $t0, 0x3880

    # 0x13880 should now be in $a0

    li $v0, 1
    syscall


    li $v0, 10
    syscall
    .end main

