
    .text 
    .globl main
    .ent main

    main:
        addi $s0, $0, 4   # $s0 = DIM
        addi $s1, $0, 0     # $s1 = 0 = sum
        addi $t0, $0, 0     # $t0 = i = 0

    input_loop:
        beq $t0, $s0, end

        li $v0, 5           # Read integer
        syscall

        add $s1, $s1, $v0   # Update total sum

        addi $t0, $t0, 1
        j input_loop
    end:

        div $s1, $s0

        mflo $a0

        li $v0, 10
        syscall
    .end main