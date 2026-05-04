.text
.global fib
.type fib, %function

; Calcola il numero di Fibonacci - R0 riceve n
fib:
    cmp r0, #1          ; caso base: n <= 1?
    bgt ricorsione      ; se n > 1, procedi con la ricorsione
    
    ; Caso base: n=0 -> 0, n=1 -> 1. In entrambi i casi, il risultato e' n.
    mov pc, lr          ; Ritorna R0 cosi com'e' (0 o 1)

ricorsione:
    push {r0, r4, lr}   ; Salva n (r0), un registro di supporto (r4) e LR
    
    sub r0, r0, #1      ; Prepara n-1
    bl fib              ; Chiamata ricorsiva: calcola fib(n-1)
    
    mov r4, r0          ; Salva il risultato di fib(n-1) in R4
    
    ; Recupera l'originale n dal top dello stack senza fare il pop completo
    ldr r0, [sp]        ; Legge r0 salvato (n) dallo stack
    sub r0, r0, #2      ; Prepara n-2
    bl fib              ; Chiamata ricorsiva: calcola fib(n-2)
    
    add r0, r0, r4      ; R0 = fib(n-2) + fib(n-1)
    
    pop {r1, r4, lr}    ; Pulizia dello stack (recupera r4 e lr originali)
    mov pc, lr          ; Ritorna al chiamante
      
