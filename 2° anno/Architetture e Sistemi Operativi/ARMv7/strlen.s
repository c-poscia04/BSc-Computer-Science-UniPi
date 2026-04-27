.global strlen
.type strlen, %function

strlen:
    MOV R1, #0          ; Inizializza il contatore (lunghezza) a 0
loop:
    LDRB R2, [R0], #1   ; Carica il byte puntato da R0 in R2 e incrementa R0 di 1 
    CMP R2, #0          ; Verifica se il carattere è il terminatore NULL (0) 
    BEQ fine            ; Se è 0, salta alla fine del ciclo 
    ADD R1, R1, #1      ; Altrimenti, incrementa il contatore della lunghezza
    B loop              ; Ripete il ciclo
fine:
    MOV R0, R1          ; Mette il risultato (lunghezza) in R0 per il ritorno 
    MOV PC, LR          ; Ritorna al chiamante
