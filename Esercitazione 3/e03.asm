    .data
        days: .byte 3
        hours: .byte 4
        minutes: .byte 47

    .text
    .globl main
    .ent main

    main:
        # $s0 = elapsedDays
        # $s1 = elapsedHours
        # $s2 = elapsedMinutes
        # $a0 = totalMinutes

        la $t0, days
        lb $s0, ($t0)
        la $t0, hours
        lb $s1, ($t0)
        la $t0, minutes
        lb $s2, ($t0)

        addi $a0, $0, 0

        # Convert days to minutes (* 1440)
        mul $s0, $s0, 1440
        add $a0, $a0, $s0

        # Convert hours to minutes (*60)
        mul $s1, $s1, 60
        add $a0, $a0, $s1

        # Add remaining minutes
        add $a0, $a0, $s2

        li $v0, 1 # Print integer
        syscall

        li $v0, 10
        syscall

    .end main
