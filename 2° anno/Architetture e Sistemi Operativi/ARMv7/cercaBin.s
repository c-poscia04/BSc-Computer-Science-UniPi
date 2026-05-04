.text
.global CERCA
.type CERCA, %function

CERCA:
    @ --- Caso base: il nodo e' NULL? ---
    CMP R0, #0
    MOVEQ PC, LR        @ Se nullo, ritorna 0 (non trovato)

    @ --- Caso base: valore trovato nel nodo attuale? ---
    LDR R2, [R0]        @ Carica il valore del nodo
    CMP R2, R1          @ Confronta con il valore cercato (R1)
    MOVEQ R0, #1        @ Se uguale, imposta R0 = 1
    MOVEQ PC, LR        @ E ritorna al chiamante

    @ --- Ricerca Ricorsiva sui due rami ---
    PUSH {R4, R5, LR}   @ Salva i registri callee-saved e il link register
    
    LDR R4, [R0, #8]    @ Salva il puntatore al figlio destro in R4
    PUSH {R1, R4}       @ Salva sullo stack: valore cercato e figlio destro
    
    LDR R0, [R0, #4]    @ Prepara R0 con l'indirizzo del figlio sinistro
    BL CERCA            @ Chiamata ricorsiva sul ramo sinistro

    @ Al ritorno, R0 contiene 1 (trovato) o 0 (non trovato)
    POP {R1, R2}        @ R1 = valore cercato originale, R2 = figlio destro
    PUSH {R0}           @ Salva il risultato (1 o 0) del ramo sinistro
    
    MOV R0, R2          @ Prepara R0 con il figlio destro per la prossima chiamata
    BL CERCA            @ Chiamata ricorsiva sul ramo destro

    @ Al ritorno, R0 contiene il risultato del ramo destro
    POP {R1}            @ Recupera in R1 il risultato del ramo sinistro
    ORR R0, R0, R1      @ Esegue l'operazione logica OR: basta che uno sia 1
    
    POP {R4, R5, PC}    @ Ripristina i registri e torna al chiamante
