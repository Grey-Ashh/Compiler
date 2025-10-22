#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<ctype.h>

int i=0,j=0,len=0,z=0;
char act1[20]="shift ->";
char act2[20]="Reduce to E";
char inp[20],stk[20];

void check();

int main()
{
    printf("Grammer: \nE->TE'\nE/e'->+TE'\nT->FT'\nF->*FT'/e\nF->id\n");
    printf("Enter the input: ");
    scanf("%s",inp);
    len=strlen(inp);
    printf("stack\tinput\taction\n");

    for(j=0;j<len;i++,j++)
    {
        if(inp[j]=='i' && inp[j+1]=='d')
        {
            stk[i]=inp[j];
            stk[i+1]=inp[j+1];
            stk[i+2]='\0';
            inp[j]=' ';
            inp[j+1]=' ';
            printf("$%s\t%s$\t%s id\n",stk,inp,act1);
            check();
        }
        else if (inp[j]=='+' || inp[j]=='*'|| inp[j]=='('|| inp[j]==')' ||inp[j]=='E')
        {
            stk[i] = inp[j];
            stk[i + 1] = '\0';
            inp[j] = ' ';
            printf("$%s\t%s$\t%s sym\n", stk, inp, act1);
            check();
        }
        else
        {
         printf("error\n");
         exit(1);
        }
    }
    return 0;
}

void check()
{
    for(z=0;z<len;z++)
    {
        if(stk[z]=='i' && stk[z+1]=='d')
        {
            stk[z]='E';
            stk[z+1]='\0';
            printf("$%s\t%s$\t%s \n",stk,inp,act2);
            j++;
        }        
    }

    for(z=0;z<len;z++)
    {
        if(stk[z]=='E' && stk[z+1]=='+' && stk[z+2]=='E')
        {
            stk[z]='E';
            stk[z+1]='\0';
            stk[z+2]='\0';
            printf("$%s\t%s$\t%s \n",stk,inp,act2);
            i=i-2;
        }        
    }

    for(z=0;z<len;z++)
    {
        if(stk[z]=='E' && stk[z+1]=='*' && stk[z+2]=='E')
        {
            stk[z]='E';
            stk[z+1]='\0';
            stk[z+2]='\0';
            printf("$%s\t%s$\t%s \n",stk,inp,act2);
            i=i-2;
        }        
    }

    for(z=0;z<len;z++)
    {
        if(stk[z]=='(' && stk[z+1]=='+' && stk[z+2]==')')
        {
            stk[z]='E';
            stk[z+1]='\0';
            stk[z+2]='\0';
            printf("$%s\t%s$\t%s \n",stk,inp,act2);
            i=i-2;
        }        
    }

}