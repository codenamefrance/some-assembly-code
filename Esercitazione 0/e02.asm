# Dichiaro una variabile wVar e ci ficco dentro il valore 3 decimale
    .data
        wVarSource: .word  3
# bVar se lavoro sui byte (come indirizzamento) - calcoli per spostare
#   puntatori -> byte (da una parola all'altra, +4 byte)

    .text
    .globl main
    .ent main

main:
    


    li $v0, 10
    syscall

