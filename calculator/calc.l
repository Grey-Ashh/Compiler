%{
#include<stdio.h>
#include<ctype.h>
#include "y.tab.h"
extern int yylval;
%}

%%

[0-9]+ {yylval=atoi(yytext);return NUMBER;}
[\n]   {return 0;}
[ \t]+ ;  
.      {return yytext[0];}

%%

yywrap()
{
    return 1;
}