%{
#include<stdio.h>
#include<string.h>
#include "y.tab.h"
%}

%%

[a-z ]+ {yylval.str=yytext;return STR;}
.       {printf("invalid");return 0;}

%%

yywrap()
{
    return 1;
}
