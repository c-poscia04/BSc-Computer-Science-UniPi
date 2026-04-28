.global fun
fun:
    LSL R1, R0, #1      ; R1 = 2x
    ADD R1, R1, R0      ; R1 = 2x + x = 3x
    ADD R1, R1, #1      ; R1 = 3x + 1
    ASR R0, R1, #2      ; R0 = (3x + 1) / 4 (risultato in R0 per il ritorno)
    MOV PC, LR          ; Ritorna al chiamante
