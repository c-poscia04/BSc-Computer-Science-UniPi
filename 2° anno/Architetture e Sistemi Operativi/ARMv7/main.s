.text                  @ Inizio della sezione del codice eseguibile
	.global main           @ Dichiara 'main' come simbolo globale (punto di ingresso del programma)
	.type main, %function  @ Specifica che 'main' è una funzione

main:	
	mov r3, #123           @ Salva il numero costante 123 dentro il registro r3
	
	ldr r0, =fmt           @ Carica in r0 l'indirizzo di memoria della stringa "Risultato %d\n" (1° argomento per printf)
	mov r1, r3             @ Copia il valore 123 da r3 a r1 (2° argomento per printf, sostituisce %d)
	push {lr}              @ Salva il Link Register (LR) nello stack per non perdere l'indirizzo di ritorno
	bl printf              @ Salta alla funzione di libreria 'printf' (Branch with Link), salvando il ritorno in LR

	pop {pc}               @ Estrae dallo stack il valore salvato e lo mette nel Program Counter (PC), chiudendo il main
	

	.data                  @ Inizio della sezione dei dati in memoria (variabili e costanti)
fmt:	
	.string "Risultato %d\n" @ Definisce la stringa di formattazione terminata da null, con il segnaposto %d e ritorno a capo
