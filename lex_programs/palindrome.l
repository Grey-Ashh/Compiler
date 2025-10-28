%{
#include<stdio.h>

%}

%%
[a-z]+ {
            int flag=1;
            int l=yyleng;
            for(int i=0;i<l/2;i++)
            {
                if(yytext[i]!=yytext[l-i-1])
                    flag=0;
            }
            if(flag)
                printf("palindrome");
            else
                printf("not palindrome");
       }
.      {printf("error");return 0;}
%%

int main()
{
    char inp[10];
    printf("enter the word: ");
    scanf("%s",inp);
    YY_BUFFER_STATE buffer=yy_scan_string(inp);
    yylex();
    yy_delete_buffer(buffer);
    return 0;
}

int yywrap()
{
    return 1;
}