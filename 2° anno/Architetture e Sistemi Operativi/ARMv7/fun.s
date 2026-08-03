.text
	.global fun
	
fun:
	; f(x) = (3x+1)/4
	; Parametro 'x' ricevuto in r0
	
	lsl r1, r0, #1      ; r1 = x * 2 (spostamento a sinistra di 1 bit = moltiplicazione per 2)
	add r1, r1, r0      ; r1 = (2 * x) + x = 3x
	add r1, r1, #1      ; r1 = 3x + 1
	asr r0, r1, #2      ; r0 = (3x + 1) / 4 (spostamento a destra aritmetico di 2 bit = divisione per 4)
	
	mov pc, lr          ; Ritorna al chiamante (salto all'indirizzo in LR)
