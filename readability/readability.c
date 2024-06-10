#include <cs50.h>
#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include <math.h>

typedef struct
{
    string name;
    string number;
}
person;

int count_letters (string l);
int count_words (string w);
int count_sentences (string s);

int main (void)
{

    string text = get_string("Text: ");
    int letters = count_letters (text);
    int word = count_words(text);
    int sentence= count_sentences(text);
    float lol = (float) letters / (float) word *100;
    float sol = (float) sentence / (float) word * 100;
    int index = round(0.0588 * lol - 0.296 * sol - 15.8);


    if (index >= 16)
    {
        printf("Grade 16+\n");
    }
    else if (index <= 1)
    {
        printf("Before Grade 1\n");
    }
    else if (index >1 && index<16)
    {
        printf("Grade %i\n", index);
    }


    }

    int count_letters (string l)
    {
        int letters = 0;
        for (int i = 0; i < strlen(l); i++)
    {
        if ((l[i] != '\0' && l[i] >= 97 && l[i] <= 122) || (l[i] >= 65 && l[i] <= 90))
        {
            letters++;
        }
    }
    return letters;
    }

    int count_words (string w)
    {
        int word = 1;
        for (int i = 0; i < strlen(w); i++)
        {
            if (w[i] == ' ')
        {
            word++;
        }
        }
        return word;
    }

    int count_sentences (string s)
    {
        int sentence = 0;
        for (int i = 0; i < strlen(s); i++)
    {
        if (s[i] == '.'|| s[i] == '?' || s[i] == '!')
        {
            sentence++;
        }

    }
    return sentence;
}