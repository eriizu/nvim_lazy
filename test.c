#include <string.h>
#include <stdlib.h>
#include <stdio.h>

struct patate {
  int a;
  int b;
};
int main(int ac,
         char **av,
         char **envp)
{
  struct patate fifi;
  int i;

  i = 0;
  while (envp[i]
         && 1) {
    puts(envp[i++]);
  }
  fifi.a = 12;
  fifi.b = (666 +
            12);
  char *str1;
  str1 = malloc(sizeof(char) * 10);
  strcpy(str1, "hello");
  return strlen(str1);
}
