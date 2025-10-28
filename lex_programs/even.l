%{
#include<stdio.h>
#include<ctype.h>

%}

%%
[0-9]+ {
            int num=atoi(yytext)
            if(num%2==0)
                printf("even");
            else
                printf("odd");
       }
.      {printf("error");return 0;}
%%

int main()
{
    char inp[10];
    printf("enter the num: ");
    scanf("%s",inp)
    YY_BUFFER_STATE buffer=yy_scan_string(inp);
    yylex();
    yy_delete_buffer(buffer);
    return 0;
}

int yywrap()
{
    return 1;
}