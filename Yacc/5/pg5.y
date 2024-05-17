%{
#include<stdio.h>
#include<stdlib.h>
%}
%token DIGIT LETTER UND NL
%%
stmt : variable NL { printf("Valid variable\n"); exit(0);};
variable : LETTER alphanumeric
| LETTER
;
alphanumeric: LETTER alphanumeric
| DIGIT alphanumeric
| UND alphanumeric
| LETTER
| DIGIT
| UND
;
%%
int yyerror()
{
printf("Invalid variable\n");
exit(0);
}
int main ()
{
printf("Enter the variable name\n");
yyparse();
}
