## Esercizi ARMv7 🚧

* **[Esercizio 1](fun.s)**: Implementare una funzione che calcoli $f(x) = \frac{3x+1}{4}$.
* **[Esercizio 2](main.s)**: Stampa a schermo di un intero.

* **[Esercizio 2](check.s)**: Controllare se un numero da 32 bit è una potenza di 2.
* **[Esercizio 3](ce.s)**: Implementare in ARMv7 la funzione con firma int ce(int x, int *v, int n); che restituisce 1 se x compare nel vettore di interi v di lunghezza n, 0 altrimenti. La funzione deve essere realizzata senza utilizzare registri non temporanei (vincolo obbligatorio da rispettare).
* **Esercizio 3**: Si implementi, utilizzando ARMv7, una funzione int conta(int n) che calcola il numero di bit a 1 in un intero e successivamente la si utilizzi per implementare una seconda funzione int pot(int n) che restituisce $1$ (vero) se il numero passato come parametro è una potenza di due, 0 (falso) altrimenti.
* **Esercizio 4**: Conta il numero di occorrenze di ciascun carattere in una stringa.
* **[Esercizio 5](fact.s)**: Calcolo del fattoriale di un numero.
* **[Esercizio 6](strlen.s)**: Funzione strlen che restituisce la lunghezza di una stringa terminata dal carattere nullo \0.
* **[Esercizio](fib.s)**: Calcolo dei numeri di Fibonacci.
* **[Esercizio](exp.s)**: Calcolo dell'esponenziale ricorsivo.
* **Esercizio**: Calcolare la somma delle cifre decimali che appaiono in una stringa ASCII.
* **Esercizio**: conversione in binario.
* **Esercizio**: Calcolo di un polinomio con i parametri passati sullo stack.
* **Esercizio**: Calcolo della trasposta di una matrice.
* **Esercizio**: Map su lista.
* **Esercizio**: Prodotto tra vettori.
* **[Esercizio](cercaBin.s)**: Funzione cerca(nodo *A, int x) che ricerca l'elemento x in un albero binario.
* **[Esercizio](ricercaIt.s)**: Ricerca iterativa su lista.
* **Esercizio**: Implementare in assembler ARMv7 una procedura di signature:
ELEM * insert(ELEM * lista, int info)
che opera su elementi definiti come
typedef struct __e { int info, struct __e * next} ELEM;
inserendo, in fondo alla lista puntata dal parametro lista un nuovo elemento con informazione info
restituendo il puntatore (modificato, se necessario) alla lista. La procedura deve rispettare tutte le
convenzioni ARMv7, in modo che possa essere chiamata da altro codice, C o assembler. Per allocare
la memoria necessaria a contenere il nuovo elemento, si faccia uso di una chiamata alla funzione di
libreria malloc.
* **Esercizio**: L’insieme dei registri letti e scritti da una istruzione sono rappresentati da due bitmap in un registro
da 32 bit: i 16 bit più alti rappresentano i registri letti dall’istruzione; i 16 meno significativi
rappresentano i registri scritti dall’istruzione.
Si richiedere di scrivere in ARMv7 una funzione bernstein che riceve nei due parametri in ingresso
l’insieme dei registri letti e scritti da due istruzioni, codificati come descritto precedentemente, e
restituisce 1 se e solo se valgono le condizioni di Bernstein fra le due istruzioni, 0 altrimenti.
* **Esercizio**: Un albero binario i cui nodi mantengono una informazione di tipo intero è rappresentato utilizzando
nodi di tre parole: la prima (info) contiene l’informazione numerica, la seconda e la terza (left e right)
contengono il puntatore al figlio sinistro e destro e possono essere NULL in caso di assenza del
sottoalbero destro e/o sinistro.
Si fornisca un’implementazione in ARMv7 che cerca se in un albero di cui è nota la radice si trovi o
meno un nodo con una certa informazione. La funzione cerca deve avere la firma seguente
int cerca(NODO *radice, int x);
e restituisce 1 se nell’albero c’è almeno una occorrenza dell’intero x oppure 0 altrimenti. E’
consigliato pensare ad una implementazione ricorsiva:
int cerca(NODE* r, int i) {
if(r == NULL) return(0);
if(r->info == i) return(1);
int cl = c_cerca(r->left,i);
int cr = c_cerca(r->right,i);
return(cl | cr);
}   
* **Esercizio**: Una lista è formata da elementi di tipo Node che contengono due campi: value (intero con segno) e
next (puntatore al prossimo elemento). Si supponga di avere a disposizione una funzione con firma
int check(Node *L1, int x);
che ritorna 1 se il valore x è contenuto nella lista L1 oppure 0 altrimenti. Si richiede di sviluppare
una funzione ARMv7 (rispettando tutti i vincoli e regole viste a lezione) con la seguente firma
Node *addDistinct(Node *L1, Node *L2);
Il suo effetto è quello di aggiungere in cima ad L1 gli elementi di L2 il cui campo value non è già
presente in L1. La funzione ritorna in uscita il puntatore all’inizio della nuova lista. Si può assumere
che la lista L2 non contenga elementi con lo stesso campo value.
* **Esercizio**: (esercizio 2 - esame 3 settembre 2025)
* **Esercizio**: Si fornisca il codice ARMv7 di una funzione con firma void conta(istr_t *p, int n) che stampa,
chiamando una printf, il numero di istruzioni operative, di load/store e di salto nel segmento di codice
ARMv7 di n>0 istruzioni che cominciano all’indirizzo p. Si utilizzino tutte le convenzioni relative
alla codifica delle funzioni di ARMv7.
* **Esercizio**: esercizio 1 gennaio 2026
* **Esercizio**: Si realizzi una funzione in ARMv7 che riceve due interi codificati in modulo e segno su 16 bit e
restituisce il loro prodotto, sempre in modulo e segno ma su 32 bit. La signature della funzione sarà
quindi:

bit32_t mult(bit16_t a, bit16_t b);

con bitNN_t tipo dei dati interi rappresentati in modulo e segno su NN bit. Dal momento che
lavoriamo su ARMv7 (a 32 bit), dati bit16_t saranno rappresentati nella parte basse dei registri
utilizzati per il passaggio di parametri e per il ritorno del risultato di una funzione. Per
l’implementazione della funzione mult NON si può utilizzare l’istruzione MUL, pure presente
nell’assembler ARMv7.
Si ricorda che la rappresentazione modulo e segno su N bit prevede che il bit più significativo sia
utilizzato per rappresentare il segno (0 per + e 1 per -) e che i rimanenti N-1 bit rappresentano il
valore assoluto del numero.
