# ----------------
#   Introduction

# In order to check if a number is > 255, you may use the MASK 0xFFFFFF00 (because 255 is the 
# largest number representable on 1 byte)
# REMEMBER: in HEX one letter represent 4 bits

# ----------------
#   Data declaration:
    .data
        no: .asciiz "Il numero è maggiore di 255 -> Non posso rappresentarlo su un byte\n"

# ----------------
#   Text/code section:
    .text
    .globl main
            
# ---------------
#   Error handling function:
        print_error:        
                            li $v0, 4
                            la $a0, no
                            syscall
                            j end
        
# ---------------
#   Main function:
        main:   
                    
        # -------------
        #   User input and byte check via and with 0xFFFFFF00 (last two digits for 255)
                            li $t0, 0xFFFFFF00
                            li $v0, 5
                            syscall
                            and $s1, $v0, $t0
                    
                            bne $s1, 0, print_error
                            move $s2, $v0           # Store A in s2

                            li $v0, 5
                            syscall
                            and $s1, $v0, $t0
                    
                            bne $s1, 0, print_error
                            move $s3, $v0           # Store B in s3

        # -------------
        #   Evaluating boolean expression:

        operation:          
                            nor $t1, $s3, $s3       # Store NOT(B) in $t1
                            and $t2, $s2, $t1       # Store A and NOT(B) in t2

                            nor $t3, $t2, $t2       # Store the first part of equation in $t3...
                            xor $t4, $s2, $s3       # ...and the second one in $t4

                            or $t5, $t3, $t4        # Final result of the expression in $t5 (exp. 1)
                            
                            move $a0, $t5           # Console-print the result
                            li $v0, 1
                            syscall

        
        end:                li $v0, 10
                            syscall
        
        .end main

