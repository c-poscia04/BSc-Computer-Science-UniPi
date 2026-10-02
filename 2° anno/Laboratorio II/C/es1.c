#include <stdio.h>

int main() {
    int n; 
    int pos = 0;
    int quanti = 0;
    int neg = 0;
    int somma_pos = 0;

    do {
            scanf("%d", &n);
            if(n == 0) break;
            quanti++;
            if(n > 0) {
                pos++;
                somma_pos += n;
            } else {
                neg++;
            }
    } while(n != 0) {
        printf("Totale: %d\n", quanti);
        printf("Positivi: %d\n", pos);
        printf("Negativi: %d\n", neg);
    }
     
return 0;
}

