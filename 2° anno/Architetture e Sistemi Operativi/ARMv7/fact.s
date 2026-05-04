.global fact
.type fact, %function
.text

; Calcola n! - R0 riceve n
fact:
    CMP r0, #0          ; Caso base: n == 0?
    BGT continue        ; Se n > 0, vai a 'continue'
    
   ; Se n <= 0, il fattoriale e' 1
    mov r0, #1          ; Carica 1 come risultato
    mov pc, lr          ; Ritorna al chiamante

continue:
    push {r0, lr}       ; Salva n (r0) e l'indirizzo di ritorno (lr) nello stack
    sub r0, r0, #1      ; Prepara n-1 per la chiamata ricorsiva
    
    bl fact       ; Chiamata ricorsiva: calcola (n-1)!
    
    ; Al ritorno: R0 contiene il risultato di (n-1)!
    pop {r1, lr}        ; Recupera il vecchio n (in r1) e il vecchio lr
    
    mul r0, r0, r1      ; R0 = (n-1)! * n
    mov pc, lr          ; Ritorna con il risultato finale in R0
