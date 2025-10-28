%{
#include<stdio.h>
int words=0;
int vowels=0;
int consonants=0;
int line=0;
FILE *yyin;
%}

%%
[aeiou]                    {vowels++;}
[bcdefghjklmnpqrstvwxyz]   {consonants++;}               
[ \t]                      {words++;}
[\n]                       {line++;words++;}
.                          ;
%%

int main()
{
    yyin=fopen("program.txt","r");
    if(!yyin)
      printf("error");
    yylex();
    int a;
    printf("words=%d\nlines=%d\n",words,line);
    printf("vowels=%d\nconsonants=%d\n",vowels,consonants);
    return 0;
}

int yywrap()
{
    return 1;
}