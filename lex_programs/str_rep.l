%%writefile program.l
%{
#include<stdio.h>
FILE *yyin;
%}

%%
[a-z ]+ {
            char word[30];
            memset(word,0,sizeof(word));
            int i;;
            for(i=0;i<yyleng;i++)
            {
                if(yytext[i]=='a' && yytext[i+1]=='b' && yytext[i+2]=='c' )
                {
                    word[i]='A';
                    word[i+1]='B';
                    word[i+2]='C';
                    i++;
                    i++;
                }
                else
                {
                  word[i]=yytext[i];
                }
            }
            word[i]='\0';
            printf("%s",word);
            
       }
[\n]   ;
.      {printf("error");return 0;}
%%

int main()
{
    yyin=fopen("input.txt","r");
    yylex();
    return 0;
}

int yywrap()
{
    return 1;
}
