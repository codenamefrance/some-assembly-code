    .data
        n1: .byte 10                # mi metto un intero su 4 bit
        n2: .byte 0x10
        n3: .byte '1'
        res: .space 1
        # res = n1 - n2 + n3

    .text
    .globl main
    .ent main
    main:
        la $t0, n1
        lb $t1, ($t0)
        la $t0, n2
        lb $t2, ($t0)
        la $t0, n3
        lb $t3, ($t0)
        
        li $t4, 0                   # will hold result

        sub $t4, $t1, $t2
        add $t4, $t4, $t3    

        la $t0, res
        sb $t4, ($t0)

    li $v0, 10
    syscall
    .end main