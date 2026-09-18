bf="$(<$1)"
bf="${bf//[!-+<>.,\[\]]}"
bf="${bf//]/\};}"
bf="${bf//[/while(*ptr){ }"
bf="${bf//+/(*ptr)++;}"
bf="${bf//-/(*ptr)--;}"
bf="${bf//>/ptr++;}"
bf="${bf//</ptr--;}"
bf="${bf//./putchar(*ptr);}"
bf="${bf//,/*ptr = getchar();}"
echo "#include <stdlib.h>
#include <stdio.h>
int main(){
  char *ptr = (char *) calloc(30000, sizeof(char));
$bf
  return 0;
}"
