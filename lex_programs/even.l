%{
#include<stdio.h>
#include<ctype.h>
#include<string.h>
%}

%%

[0-9]+      {
                int num;
                num=atoi(yytext);
                if(num%2==0)
                    printf("even\n");
                else
                    printf("odd\n");
            }
[ \t\n]+    ;
.           {printf("invalid");return 0;}

%%

int main()
{
    printf("enter the number: ");
    char input[30];
    fgets(input,sizeof(input),stdin);
    YY_BUFFER_STATE buffer=yy_scan_string(input);
    yylex();
    yy_delete_buffer(buffer);
   return 0;
}
int yywrap()
{
    return 1;
}