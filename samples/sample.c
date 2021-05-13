#include <stdio.h>

int add(int x, int y){ return x+y; }

int main(){

	// [[ 3 ]]
    printf("%d\n",add(1,2));

	// [[ nice ]]
	printf("%s","nice\n");

	// [[ NO ]]
	printf("%s","This one will fail!\n");
    return 0;
}
