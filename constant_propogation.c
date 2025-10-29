#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<ctype.h>

struct expr{
    char op[5],arg1[5],arg2[5],res[5];
    int flag;
}arr[10];
int n;
int res_1;
void change(int p,char *res)
{
    for(int i=p+1;i<n; i++)
    {
        if(strcmp(arr[p].res,arr[i].arg1)==0)
            strcpy(arr[i].arg1,res);
        else if(strcmp(arr[p].res,arr[i].arg2)==0)
            strcpy(arr[i].arg2,res);
    }
}

void input()
{
    printf("Enter the no of terms: ");
    scanf("%d",&n);
    printf("Enter the terms:\n");
    for(int i=0;i<n;i++)
    {
        scanf("%s",arr[i].op);
        scanf("%s",arr[i].arg1);
        scanf("%s",arr[i].arg2);
        scanf("%s",arr[i].res);
        arr[i].flag=0;
    }
}

void constant() {
    int a, b, res;
    char temp_res[5];

    for (int i = 0; i < n; i++) 
    {
        if (arr[i].op[0] == '=') 
        {
            strcpy(temp_res, arr[i].arg1);
            arr[i].flag = 1;
            change(i, temp_res);
        }
        else if (isdigit(arr[i].arg1[0]) && isdigit(arr[i].arg2[0])) 
        {
            a = atoi(arr[i].arg1);
            b = atoi(arr[i].arg2);
            switch (arr[i].op[0]) 
            {
                case '+': res = a + b; break;
                case '-': res = a - b; break;
                case '*': res = a * b; break;
                case '/': res = a / b; break;
                default: continue;
            }
            sprintf(temp_res, "%d", res);
            arr[i].flag = 1;
            change(i, temp_res);
        }
    }
    res_1=res;
}


void output()
{
    printf("\nexp: \n");

    int flag=0;
    int i=0;
    for(i=0;i<n;i++)
    {
        if(arr[i].flag==0)
        {
            printf("%s %s %s %s \n",arr[i].op,arr[i].arg1,arr[i].arg2,arr[i].res);
            flag=1;
        }
    }
    if (flag==0)
    {
        printf("%s %d %s %s \n","=",res_1,"-",arr[i-1].res);

    }
    
}


int main()
{
    input();
    constant();
    output();
    return 0;
}

