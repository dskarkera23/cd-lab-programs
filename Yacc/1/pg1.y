%{
#include<stdio.h>
#include<stdlib.h>
%}
%token SP SC CM NL ID INT FLOAT CHAR
%%
S:type SP list SC NL{printf("valid"); exit(0);}
;
type:INT
|CHAR
|FLOAT
;
list: list SP CM SP ID
| list CM ID
| list CM SP ID
| list SP CM ID
|ID
;
%%
int yyerror()
{
printf("Invalid Expression\n");
exit(0);
}
int main ()
{
printf("Enter the declaration statement\n");
yyparse();
}