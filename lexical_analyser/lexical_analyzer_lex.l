%{
#include<stdio.h>
FILE *yyin;
%}

ID       [a-zA-Z_][a-zA-Z0-9_]*
DIGIT    [0-9]
KEYWORD  (printf|include|int|stdio)

%%
{KEYWORD}  {printf("%s\t%s\n","keyword",yytext);}
{ID}       {printf("%s\t%s\n","identifer",yytext);}
{DIGIT}+   {printf("%s\t%s\n","digit",yytext);}
"+"        {printf("%s\t%s\n","operator",yytext);}
"-"        {printf("%s\t%s\n","operator",yytext);}
"*"        {printf("%s\t%s\n","operator",yytext);}
"/"        {printf("%s\t%s\n","operator",yytext);}
"="        {printf("%s\t%s\n","operator",yytext);}
[ \n\t]+   {}
.          {printf("%s\t%s\n","special",yytext);}
%%

int main()
{
    yyin=fopen("input.txt","r");
    printf("Token\ttype\n");
    yylex();
    fclose(yyin);
    return 0;
}
int yywrap()
{
    return 1;
}