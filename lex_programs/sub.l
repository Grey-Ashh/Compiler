%{
#include<stdio.h>

%}

%%
"abc" {printf("found");return 0;}
. ;
%%

int main()
{
    char inp[10];
    printf("enter the word: ");
    fgets(inp,sizeof(inp),stdin);
    YY_BUFFER_STATE buffer=yy_scan_string(inp);
    yylex();
    yy_delete_buffer(buffer);
    return 0;
}

int yywrap()
{
    return 1;
}