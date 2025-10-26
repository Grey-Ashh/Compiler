%{
#include<stdio.h>
int valid=1;
%}

%token letter digit

%%

start: letter s
;
s: letter s
 |digit s 
 |
;

%%

int main()
{
    printf("Enter the identifer: ");
    yyparse();
    if(valid)
        printf("valid identifer\n");
    return 0;
}

void yyerror()
{
    printf("Invalid identifer\n");
    valid=0;
}
