#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<ctype.h>

char lookahead;
char *input;
void E();
void EP();
void T();
void TP();
void F();

void next_char()
{
    lookahead=*input++;
}

void match(char exp)
{
    if(lookahead==exp)
        next_char();
    else
        printf("error : given=%c expected=%c\n",lookahead,exp);
}

void E()
{
    T();
    EP();
}

void EP()
{
    if(lookahead=='+')
    {
        match('+');
        T();
        EP();
    }
}

void T()
{
    F();
    TP();
}
void TP()
{
    if(lookahead=='*')
    {
        match('*');
        F();
        TP();
    }
}

void F()
{
    if(isalpha(lookahead))
    {
        while (isalpha(lookahead))
        {
            match(lookahead);
        }
    }
    else if(lookahead=='(')
    {
        match('(');
        E();
        match(')');
    }
    else
    {
        printf("Error \n");
        exit(1);
    }
}

int main()
{
    char in[20];
    printf("Grammer: \nE->TE'\nE/e'->+TE'\nT->FT'\nF->*FT'/e\nF->id\n");
    printf("Enter the input: ");
    scanf("%s",in);
    input=in;
    next_char();
    E();
    if(lookahead=='\0')
        printf("input accepted.\n");
    else
        printf("input rejected.\n");
}