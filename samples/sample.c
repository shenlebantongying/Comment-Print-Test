#include <stdio.h>

int add(int x, int y){
	return x+y;
}

char* a_function_that_will_fail(int useless_arg){
	return "This one will fail!\n";
}

int main(){

	// [[ 3 ]]
    printf("%d\n",add(1,2));

	// [[ NO ]]
	printf("%s",a_function_that_will_fail(1));

	// [[ NICE and MORE NICE ]]
	printf("%s","NICE and MORE NICE\n");
    return 0;
}
