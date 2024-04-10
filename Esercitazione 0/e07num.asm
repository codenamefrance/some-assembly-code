# Esercitazione MIPS 01 - E07 - Extra
# Acquisizione e calcolo del minimo di un vettore

    .data
        vett: .space 20 # 5 characters, each of 4 bytes (20 bytes)
        msg_in: .asciiz "Please, input 5 numbers.\n"
        msg_out: .asciiz "Minimum is: "
    .text
    .globl main
    .ent main

    main:
        la $a0, msg_in
        li $v0, 4 # Siscall 4 -> print string terminated by NULL value
        syscall

        la $t0, vett
        li $t1, 0 # I'm using t1 as a counter
        j loop1

    upMin: 
        # t3 is lt t2
        move $t2, $t3
        j resumeLoop


    loop1: 
        li $v0, 5 # Syscall 5 - Read integer stored in $v0
        syscall
        sw $v0, ($t0)

        addi $t0, $t0, 4 # Advance in the vector
        addi $t1, $t1, 1 # Increase counter

        bne $t1, 5, loop1

        la $a0, msg_out
        li $v0, 4
        syscall

        la $t0, vett # "Restart" the vector pointer
        li $t1, 0 # Counter
        lw $t2, ($t0)
        addi $t0, $t0, 4 # Advance in the vector
        addi $t1, $t1, 1 # Increase counter


    loop2: 
        lw $t3, ($t0)
        bltu $t3, $t2, upMin # Updates minimum when $t3 < $t2
    resumeLoop:
        addi $t0, $t0, 4 # Advance in the vector
        addi $t1, $t1, 1 # Increase counter

        bne $t1, 5, loop2
    # END OF LOOP 2

        la $a0, msg_out
        li $v0, 4
        syscall
        move $a0, $t2
        li $v0, 1
        syscall

    
        li $v0, 10
        syscall


    .end main




