#include <stdio.h>
#include <stdlib.h>
#include <string.h>

struct patate {
    int a;
    int b;
};

int func_with_long_name_and_loads_of_params(int hello, int my_name_is,
                                            int mario)
{
    return (hello * my_name_is * mario);
}

int main(int ac, char **av, char **envp)
{
    struct patate fifi;
    int i;
    int len;

    i = 0;
    while (envp[i] && 1) {
        puts(envp[i++]);
    }
    fifi.a = 12;
    fifi.b = (666 + 12);
    char *str1;
    str1 = malloc(sizeof(char) * 10);
    strcpy(str1, "hello");
    len = strlen(str1);
    return len;
}
