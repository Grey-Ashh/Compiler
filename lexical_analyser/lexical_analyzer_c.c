#include<stdio.h>
#include<string.h>
#include<ctype.h>

int main()
{
    FILE *in;
    in=fopen("input.txt","r");
    char ch;
    char word[20],digit[20];
    int line=1,token=1,flag;
    char keywords[10][10]={"int","float","if","else","printf","include","stdio"};

    printf("Ln no\ttk no\ttype\tlexeme\n");
    while ((ch=fgetc(in))!=EOF)
    {
        if(ch==' '|| ch=='\t')
        {
            continue;
        }
        if(ch=='\n')
        {
            line++;
            continue;
        }
        if(ch=='+'||ch=='/'||ch=='-'||ch=='*'||ch=='%')
        {
            printf("%d\t%d\tOperator\t%10c\n",line,token++,ch);
            continue;
        }
        if(ch==';'||ch=='('||ch==')'||ch=='{'||ch=='}'||ch=='"'||ch=='<'||ch=='#'||ch=='='||ch=='>')
        {
            printf("%d\t%d\tSpecial\t%10c\n",line,token++,ch);
            continue;
        }
        if(isalpha(ch))
        {
            int i=0;
            memset(word,0,sizeof(word));
            word[i]=ch;
            i++;
            while ((ch=fgetc(in))!=EOF && (isalnum(ch)||ch=='_'))
            {
                word[i]=ch;
                i++;
            }
            flag=0;
            for(int j=0;j<5;j++)
            {
                if(strcmp(word,keywords[j])==0)
                    flag=1;
            }
            if(flag==1)
                printf("%d\t%d\tKeyword\t%15s\n",line,token++,word);
            else
                printf("%d\t%d\tIdentifier\t%3s\n",line,token++,word);
            continue;
        }
        if(isdigit(ch))
        {
            int i=0;
            digit[i]=ch;
            i++;
            while ((ch=fgetc(in))!=EOF && isdigit(ch))
            {
                digit[i]=ch;
                i++;
            }
            printf("%d\t%d\tdigit\t%10s\n",line,token++,digit);
            memset(digit,0,sizeof(digit));
            continue;
        }
        if(ch!=EOF)
            fseek(in,-1,SEEK_CUR);
    }
    fclose(in);
    return 0;
}