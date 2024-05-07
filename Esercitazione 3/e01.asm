    .data
            message: .asciiz "Please, input a number: \n"
            message_error: .asciiz "Hai inserito una cifra non valida: "
    .text
    .globl main
    .ent main


    main:                   li $v0, 4                       # Print del messaggio
                            la $a0, message
                            syscall

                            li $s1, 0                       # $s1 alla fine conterrà il numero
                            li $s2, 1                       # potenza di 10
                            li $t5, 0xFFFFFFFF               # greatest number on 4 bytes

    loop:
                            li $v0, 12                      # Input del numero char by char
                            syscall
                            move $t0, $v0
                            beq $t0, 10, end                # If \n, skip to the end

                            move $t3, $t0
                            addi $t0, $t0, -48              # Get a decimal digit

                            blt $t0, 0, error
                            bgt $t0, 9, error

                            mul $s1, $s1, 10                # Spazio per la nuova cifra
                            add $s1, $s1, $t0
                            ##bgt $s1, $t5, end               # bigger than 4 bytes

                            j loop
    error: 
                            li $v0, 4
                            la $a0, message_error
                            syscall
                            li $v0, 11
                            move $a0, $t3
                            syscall
                            j end

    end:
                            li $v0, 10
                            syscall
    .end main