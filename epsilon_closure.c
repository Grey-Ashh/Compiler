#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int transaction[10][10];
int visited[10];
int n;

void epsilon_closure(int state)
{
    visited[state]=1;
    for(int i=0;i<n;i++)
    {
        if(transaction[state][i] && !visited[i])
        {
            epsilon_closure(i);
        }
    }
}

int main()
{
    printf("Enter the no of states :");
    scanf("%d",&n);
    printf("Enter the states 1 if e else 0\n");
    printf("    ");
    for(int i=0;i<n;i++)
        printf("q%d ",i);

    for(int i=0;i<n;i++)
    {
        printf("\nq%d->",i);
        for(int j=0;j<n;j++)  
            scanf("%d",&transaction[i][j]);
    }
    printf("\n");
    for(int i=0;i<n;i++)
    {
        for(int j=0;j<n;j++)
            visited[j]=0;

        epsilon_closure(i);

        printf("e-closure of q%d = {",i);
        for(int j=0;j<n;j++)
        {
            if(visited[j])
                printf("q%d ",j);
        }
        printf("}\n");
    }    
    return 0;
}