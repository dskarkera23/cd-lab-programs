%{
#include<stdio.h>
#include<stdlib.h>
int posint=0, negint=0,posfrac=0, negfrac=0;
%}
%%
[-][0-9]+ {negint++;}
[+]?[0-9]+ {posint++;}
[+]?[0-9]*\.[0-9]+ {posfrac++;}
[-][0-9]*\.[0-9]+ {negfrac++;}
. {;}
%%

int main(int argc, char *argv[])
{
if(argc!=2)
{
printf("Usage: ./a.out p3in.txt\n");
exit(0);
}
yyin=fopen(argv[1],"r");
yylex();
printf("No of +ve integers=%d\n No of –ve integers=%d\n No of +ve fractions=%d\n No of –ve fractions=%d\n", posint, negint, posfrac, negfrac);
}