%{
#include<stdio.h>
#include<string.h>
int noprt=0, nopnd=0, valid=1, top=-1,l=0, j=0;
char opnd[10][10], oprt[10][10], a[100];
%}
%%
"(" { top++; a[top]='(' ; }
"{" { top++; a[top]='{' ; }
"[" { top++; a[top]='[' ; }
")" { if(a[top]!='(')
{
valid=0; return 0;
}
else
top--;
}
"}" { if(a[top]!='{')
{
valid=0; return 0;
}
else
top--;
}
"]" { if(a[top]!='[')
{
valid=0; return 0;
}
else
top--;
}
"+"|"-"|"*"|"/" { noprt++;strcpy(oprt[l], yytext);l++; }
[0-9]+|[a-zA-Z][a-zA-Z0-9]* {nopnd++; strcpy(opnd[j],yytext);j++;}
%%
int yywrap()
{
return 1;
}
int main()
{
int k;
printf("Enter the expression.. at end press Ctrl d\n");
yylex();
if(valid==1 && (nopnd-noprt)==1 && top==-1)
{
printf("The expression is valid\n");
printf("Number of operands are:%d\n Number of operators are:%d\n ",nopnd, noprt);
printf("The operands are:\n");
for(k=0;k<=l;k++)
printf("%s\n",opnd[k]);
printf("Operators are\n");
for(k=0;k<=j;k++)
printf("%s\n",oprt[k]);
}
else
printf("The expression is invalid\n");
}