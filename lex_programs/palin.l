%{
#include<stdio.h>
#include<ctype.h>
#include<string.h>
%}

%%

[a-zA-Z0-9]* {
                int flag=0;
                int len=yyleng;
                for(int i=0;i<yyleng/2;i++)
                {
                    if(yytext[i]!=yytext[len-i-1])
                        flag=1;
                }
                if(flag==0)
                    printf("palindrome");
                else
                    printf("not palindrome");           
             }
[ \t\n]+     ;
.            {printf("invalid");return 0;}

%%

int main()
{
    printf("enter the string: ");
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