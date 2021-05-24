#include <stdio.h>

int main(){
	int x=52;
	int g=10;
	int y=g*x;
	int k=y/2;
	int aux;

	for (int i=0; i<10; i++){
		aux = y/k;
		k+=aux;
		k=k/2;
	}
	
	printf("Valor final= %d\n", k);

	return 0;	
}
