# Esercitazione MIPS 01 - E07
# Acquisizione e calcolo del minimo di un vettore (di caratteri)

    .data
        vett: .space 5 # 5 characters, each of 1 bytes (5 bytes)
        msg_in: .asciiz "Please, input 5 characters: \n"
        msg_out: .asciiz "\nMinimum character is: "
    .text
    .globl main
    .ent main

    main:
        la $a0, msg_in
        li $v0, 4 # Syscall 4 -> print string terminated by NULL value
        syscall

        la $t0, vett
        li $t1, 0 # I'm using t1 as a counter
        j loop1

    upMin: 
        # t3 is lt t2
        move $t2, $t3
        j resumeLoop


    loop1: 
        li $v0, 12 # Syscall 5 - Read integer stored in $v0
        syscall
        sb $v0, ($t0)

        addi $t0, $t0, 1 # Advance in the vector -> next byte
        addi $t1, $t1, 1 # Increase counter

        bne $t1, 5, loop1


        la $t0, vett # "Restart" the vector pointer
        li $t1, 0 # Counter
        lb $t2, ($t0)

        addi $t0, $t0, 1 # Advance in the vector
        addi $t1, $t1, 1 # Increase counter


    loop2: 
        lb $t3, ($t0)
        bltu $t3, $t2, upMin # Updates minimum when $t3 < $t2
    resumeLoop:
        addi $t0, $t0, 1 # Advance in the vector
        addi $t1, $t1, 1 # Increase counter

        bne $t1, 5, loop2
    # END OF LOOP 2

    la $a0, msg_out
    li $v0, 4
    syscall
    move $a0, $t2
    li $v0, 11
    syscall

    
        li $v0, 10
        syscall


    .end main




