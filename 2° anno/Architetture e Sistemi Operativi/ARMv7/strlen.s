
   Sottoprogramma: strlen
   Input:  R0 = Indirizzo base della stringa
   Output: R0 = Lunghezza della stringa (escluso lo \0)

strlen:
    MOV R1, #0          @ R1 sarà il nostro contatore (len = 0)

loop:
    LDRB R2, [R0, R1]   @ Carica un singolo BYTE dalla memoria:
                        @ R2 = Memoria[R0 + R1]
    
    CMP  R2, #0         @ Il carattere caricato è il terminatore nullo?
    BEQ  fine           @ Se R2 == 0, salta alla fine

    ADD  R1, R1, #1     @ Altrimenti: incrementa il contatore (len++)
    B    loop           @ Torna all'inizio del ciclo

fine:
    MOV  R0, R1         @ Sposta il risultato finale in R0 (valore di ritorno)
    MOV  PC, LR         @ Ritorna al chiamante
