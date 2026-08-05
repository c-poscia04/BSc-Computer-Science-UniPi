.global fact
.type fact, %function

fact: 
    cmp r0, #0
    beq base            ; Se r0 == 0, salta al caso base

    ; --- CASO RICORSIVO ---
    push {r0, lr}       ; Salva sullo stack n (in r0) e l'indirizzo di ritorno (lr)
    sub r0, r0, #1      ; Calcola n - 1
    bl fact             ; Chiama ricorsivamente fact(n-1). Il risultato ora è in r0.
    
    ; Adesso dobbiamo recuperare il vecchio 'n' dallo stack e moltiplicarlo per il risultato (in r0)
    mov r1, r0          ; Sposta temporaneamente il risultato di fact(n-1) in r1
    pop {r0, lr}        ; Ripristina il vecchio 'n' in r0 (e il vecchio lr)
    
    mul r0, r0, r1      ; Calcola n * fact(n-1) e mette il risultato in r0
    mov pc, lr          ; Ritorna al chiamante

base: 
    mov r0, #1          ; Caso base: se n == 0, restituisce 1
    mov pc, lr          ; Ritorna al chiamante
