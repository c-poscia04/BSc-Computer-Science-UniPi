.global Exp
.type Exp, %function
.text

; Parametri di input: 
;   R0 = base (x)
;   R1 = esponente (n)
; Valore di ritorno: 
;   R0 = x^n

Exp:
    CMP r1, #0          ; Confronta l'esponente n con 0
    BEQ base            ; Se n == 0, salta al caso base

    ; --- CASO RICORSIVO (n > 0) ---
    push {r0, lr}       ; Salva sullo stack la base (R0) e l'indirizzo di ritorno (LR)
    
    sub r1, r1, #1      ; Decrementa l'esponente (n - 1)
    bl Exp              ; Chiamata ricorsiva: calcola x^(n-1). Il risultato torna in R0.
    
    pop {r2, lr}        ; Ripristina dal stack la base originale mettendola in R2, e il vecchio LR
    mul r0, r2, r0      ; Moltiplica la base originale (R2) per il risultato parziale (R0)
    mov pc, lr          ; Ritorna al chiamante con il risultato finale in R0

base: 
    ; --- CASO BASE (n = 0) ---
    mov r0, #1          ; x^0 = 1, quindi carica 1 nel registro di ritorno R0
    mov pc, lr          ; Ritorna al chiamante
