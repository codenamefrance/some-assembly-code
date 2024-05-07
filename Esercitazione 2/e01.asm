#####
#   Data definition:
    .data 
        output_str: .asciiz "Please input a number:\n"
        is_even: .asciiz "Il numero è pari\n"
        is_odd: .asciiz "Il numero è dispari\n"
    
    .text
    .globl main
    .ent main

#####
#   User input stored in $v0
    main:   
        li $v0, 4
        la $a0, output_str
        syscall
        
        li $v0, 5
        syscall
        move $s0, $v0

        andi $s1, $s0, 1

        bne $s1, 1, else
        la $a0, is_odd
        li $v0, 4
        syscall 
        j end

    else:   la $a0, is_even
            li $v0, 4
            syscall


    end:    li $v0, 10
            syscall
    .end main

