    .data
    var: .word 0x3FFFFFF0       # Higher bound number representation 32-bit
                                # If overflow, try insted of ADD IMMEDIATE, load 40 in a register and sum unsigned
    .text
    .globl main
    .ent main

    main:
        lw $t0, var
        mul $t1, $t0, 2
        #addi $t2, $t1, 40      # This generates overflow
        li $t4, 40
        #add $t2, $t1, $t4      # This workaround also generates overflow
        addu $t2, $t1, $t4
        sw $t2, var


        li $v0, 10
        syscall
    .end main