%{
#include<stdio.h>
#include<ctype.h>
#include<string.h>

int count;
%}

%%

[a-zA-z0-9]* {count++;}
[ \t\n]+     ;
.            ;

%%

int main()
{
    printf("enter the string: ");
    char input[30];
    fgets(input,sizeof(input),stdin);
    YY_BUFFER_STATE buffer=yy_scan_string(input);
    yylex();
    printf("no of words=%d",count);
    yy_delete_buffer(buffer);
   return 0;
}
int yywrap()
{
    return 1;
}