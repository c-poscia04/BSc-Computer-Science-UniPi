.global Exp
.type Exp, %function
.text

@ Parametri: R0 = base (x), R1 = esponente (n)

Exp:
    CMP r1, #0          @ Caso base: n == 0?
    BGT continue        @ Se n > 0, procedi con la ricorsione

    @ Caso base (n=0): ritorna 1
    mov r0, #1          @ Carica il valore di ritorno 1 in R0
    mov pc, lr          @ Ritorna al chiamante

continue:
    @ Salvataggio del contesto
    push {r0, lr}       @ Salva la base (R0) e l'indirizzo di ritorno (LR)
    
    @ Preparazione chiamata ricorsiva
    sub r1, r1, #1      @ Calcola n-1
    bl Exp              @ Chiamata ricorsiva: calcola x^(n-1)
    
    @ Ritorno dalla ricorsione
    @ In R0 ora abbiamo il risultato di x^(n-1)
    pop {r2, lr}        @ Recupera la base originale salvata e mettila in R2
                        @ Recupera il vecchio LR per poter tornare indietro
    
    @ Calcolo finale
    mul r0, r2, r0      @ R0 = base (R2) * risultato_precedente (R0)
    mov pc, lr          @ Ritorna al chiamante con il risultato in R0
