%{
#include<stdio.h>
int valid=1;
%}

%token id num op

%%

start: id '=' S ';'
;

S:id x
 | num x
 | '-'num x
 | '('S')' x
;

x:op s
 |'-' s
 |
;

%%

int main()
{
    printf("Enter the expression: ");
    yyparse();
    if(valid)
        printf("valid expr\n");
    return 0;
}

void yyerror()
{
    printf("Invalid expr\n");
    valid=0;
}
