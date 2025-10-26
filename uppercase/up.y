%{
#include<stdio.h>
#include<string.h>
int valid=0;
%}

%union{
    char *str;
};

%token <str> STR

%%

input : input line
      |
;

line: STR {
                for(int i=0;i<strlen($1);i++)
                    printf("%c",toupper($1[i]));
}
;
%%

int main()
{
    printf("Enter the stirng: ");
    yyparse();
    if(valid)
        printf("valid string\n");
    return 0;
}

void yyerror()
{
    printf("Invalid string\n");
    valid=0;
}