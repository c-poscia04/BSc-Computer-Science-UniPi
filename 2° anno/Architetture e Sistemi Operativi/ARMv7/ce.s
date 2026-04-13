.text                   @ Inizio della sezione codice
.global ce              @ Rende la funzione visibile all'esterno (al C)
.type ce, %function     @ Dichiara che 'ce' è una funzione

@ Parametri in ingresso (secondo AAPCS):
@ R0: x (il valore da cercare)
@ R1: v (l'indirizzo base del vettore)
@ R2: n (il numero di elementi nel vettore)

ce:
    cmp r2, #0          @ Controllo di sicurezza: il vettore è vuoto (n=0)?
    beq nontrovato      @ Se n=0, vai direttamente a nontrovato

loop:                   @ Inizio del ciclo di ricerca
    ldr r3, [r1], #4    @ 1. Carica v[i] in R3
                        @ 2. Incrementa R1 di 4 (punta al prossimo intero)
    
    cmp r3, r0          @ Confronta il valore appena letto (R3) con x (R0)
    beq trovato         @ Se uguali, abbiamo trovato x: salta a 'trovato'
    
    subs r2, r2, #1     @ Decrementa il contatore n (n = n - 1)
                        @ La 's' aggiorna i flag di stato (Z flag)
    
    beq nontrovato      @ Se il risultato di subs è 0, il vettore è finito
    
    b loop              @ Se non abbiamo trovato x e n > 0, torna all'inizio

trovato:
    mov r0, #1          @ Carica 1 (True) come valore di ritorno in R0
    mov pc, lr          @ Ritorna al chiamante (copia Link Register in Program Counter)

nontrovato:
    mov r0, #0          @ Carica 0 (False) come valore di ritorno in R0
    mov pc, lr          @ Ritorna al chiamante
