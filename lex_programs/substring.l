%{
#include<stdio.h>
#include<ctype.h>
#include<string.h>
%}

%%

[a-zA-Z0-9]* {
                int flag=0;
                if(yytext[0]=='h'&&yytext[1]=='i')
                    flag=1;
                if(flag==1)
                    printf("substing found");
                else
                    printf("not found");           
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





------or------------



%{
#include<stdio.h>
#include<ctype.h>
#include<string.h>
%}

%%

"hi"         {printf("found");exit(1);}
[a-zA-Z0-9]* ;
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
    printf("not found");
   return 0;
}
int yywrap()
{
    return 1;
}