%{
#include<stdio.h>
#include<stdlib.h>
%}
%token NUMBER ID NL
%left '+' '-'
%left '*' '/'
%%
stmt : exp NL { printf("Valid Expression\n"); exit(0);}
;
exp : exp '+' exp
| exp '-' exp
| exp '*' exp
| exp '/' exp
| '(' exp ')'
| '{' exp '}'
| '[' exp ']'
| ID
| NUMBER;
%%
int yyerror()
{
printf("Invalid Expression\n");
exit(0);
}
int main ()
{
printf("Enter the expression\n");
yyparse();
}