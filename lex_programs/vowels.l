%{
#include<stdio.h>
#include<ctype.h>
#include<string.h>

FILE *yyin;
int count;
%}

%%

[AEIOUaeiou] {count++;}
[ \t\n]+     ;
.            ;

%%

int main()
{
    printf("enter the string: ");
    yyin=fopen("program.txt","r");
    yylex();
    printf("no of vowel=%d",count);
    return 0;

 //   printf("enter the string: ");
 //   char input[20];
 //   fgets(input,sizeof(input),stdin);
 //   YY_BUFFER_STATE buffer=yy_scan_string(input);
 //   yylex();
 //   printf("no of vowel=%d",count);
 //   yy_delete_buffer(buffer);
 //   return 0;
}
int yywrap()
{
    return 1;
}