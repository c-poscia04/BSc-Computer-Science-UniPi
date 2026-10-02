/*Scrivere un programma che chieda all’utente quanti valori vuole inserire. Leggere i
valori come numeri in virgola mobile (float). Si assuma che i valori inseriti
rappresentino numeri interi (ad esempio 4.0, 7.0, 12.0). Per ogni valore, stabilire se
il corrispondente numero intero è pari o dispari. Al termine, stampare quanti valori
pari e quanti valori dispari sono stati inseriti.*/

#include <stdio.h>

int main() {
    int tot;
    float n;
    int pari = 0, dispari = 0;

    scanf("%d", &tot);

    for(int i = 0; i < tot; i++) {
        scanf("%f", &n);
        if((int) n % 2 == 0) {
            pari++;
        } else {
            dispari++;
        }
    }
    printf("Pari: %d\n", pari);
    printf("Dispari: %d\n", dispari);

    return 0;
}
