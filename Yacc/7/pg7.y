%{
#include<stdio.h>
#include<stdlib.h>
%}
%token A B NL
%%
stmt:A A A A A A A A A A s B NL {printf("Valid string\n");exit(0);}
;
s:s A
|
;
%%
int yyerror()
{
printf("Invalid String\n");
exit(0);
}
int main()
{
printf("Enter the string\n");
yyparse();
}