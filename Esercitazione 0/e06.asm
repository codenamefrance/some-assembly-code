# Esercitazione MIPS 01 - E06
# Lettura da tastiera e visualizzazione a video di un
# vettore di 5 caratteri

    .data
        vett: .space 20 # 5 characters, each of 4 bytes (20 bytes)
        msg_in: .asciiz "Please, input 5 numbers.\n"
        msg_out: .asciiz "Here are your numbers.\n"
        sep: .asciiz "\n"
    .text
    .globl main
    .ent main

    main:
        la $a0, msg_in
        li $v0, 4 # Siscall 4 -> print string terminated by NULL value
        syscall

        la $t0, vett
        li $t1, 0 # I'm using t1 as a counter
    
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
        li $t1, 0

    print:
        lw $a0, ($t0)
        li $v0, 1 # Syscall 1 - Print Integer stored in $a0
        syscall 
        li $v0, 4
        la $a0, sep
        syscall
        addi $t0, $t0, 4 # Advance in the vector
        addi $t1, $t1, 1 # Increase counter
        bne $t1, 5, print


        li $v0, 10
        syscall


    .end main

    

