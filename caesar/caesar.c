#include <cs50.h>
#include <stdio.h>
#include <ctype.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, string argv[])
{
    if (argc != 2)
    {
        printf("Usage: ./caesar key\n");
        return 1;
    }
    for (int i = 0; i < strlen(argv[1]); i++)
    {
        if (!isdigit(argv[1][i]))
        {
            printf("Usage: ./caesar key\n");
            return 1;
        }
    }
    string plaintext = get_string("plaintext: ");
    int key = atoi(argv[1]);
    int i = 0;
    printf("ciphertext: ");

    while (plaintext[i] != '\0')
    {
        if (isupper(plaintext[i]))
        {
            printf("%c", ((int) plaintext[i] - 65 + key) % 26 + 65);
        }
        else if (islower(plaintext[i]))
        {
            printf("%c", ((int) plaintext[i] - 97 + key) % 26 + 97);
        }
        else if (plaintext[i] == ' ' || plaintext[i] == '.'|| plaintext[i] == ',' || plaintext[i] == '!')
        {
            printf("%c", (int) plaintext[i]);

        }
        i++;
    }
    printf("\n");
}

