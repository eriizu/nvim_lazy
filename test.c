#include <string.h>
#include <stdlib.h>
#include <stdio.h>

struct patate {
	int a;
	int b;
};

int main(void)
{
	struct patate fifi;

	fifi.a = 12;
	fifi.b = 666;
	char *str1;
	str1 = malloc(sizeof(char) * 10);
	strcpy(str1, "hello");
	return strlen(str1);
}
