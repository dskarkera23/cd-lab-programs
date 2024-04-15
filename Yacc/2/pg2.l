%{
#include "pg2.tab.h"
%}
%%
"if" {return IF;}
[sS][0-9]* {return S;}
[a-zA-Z][a-zA-Z0-9_]* {return ID;}
[0-9]+ {return NUMBER;}
">"|"<"|">="|"<="|"=="|"!=" {return RELOP;}
\n {return NL;}
. {return yytext[0];}
%%
int yywrap()
{
return 1;
}