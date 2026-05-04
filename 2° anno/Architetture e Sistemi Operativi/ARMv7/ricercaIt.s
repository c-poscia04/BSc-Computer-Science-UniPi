.text
.global CERCA
.type CERCA, %function

CERCA_LISTA:
    MOV R2, R0          ; Copia il puntatore corrente in R2
    MOV R0, #0          ; Prepara il valore di ritorno a "non trovato"
LOOP:
    CMP R2, #0          ; Il puntatore e NULL?
    MOVEQ PC, LR        ; Se si, esce e restituisce 0 (in R0)
    
    LDR R3, [R2], #4    ; Carica l'info in R3 e sposta R2 sul campo next
    CMP R3, R1          ; E l'elemento cercato?
    MOVEQ R0, #1        ; Se si, imposta ritorno a 1 (true)
    MOVEQ PC, LR        ; E ritorna
    
    LDR R2, [R2]        ; Altrimenti carica in R2 l'indirizzo del next
    B LOOP              ; Ricomincia il ciclo
