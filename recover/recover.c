#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

typedef uint8_t BYTE;
int main(int argc, char *argv[])
{
    //open memory card
    if (argc != 2)
    {
        printf("Usage: ./recover IMAGE \n");
        return 1;

    }

    FILE *f = fopen(argv[1], "r");
    if (f == NULL)
    {
        printf("Could not open file.");
        return 2;
    }

    FILE *out = NULL;


    //repeat til end of card- read 512 card in some buffer, if jpeg, if first jpeg,
    BYTE buffer[512];
    char filename [8] = {0};
    int i = 0;


    while (fread(buffer, sizeof(BYTE) * 512, 1, f) == 1)
    {
        if (buffer[0] == 0xff && buffer[1] == 0xd8 && buffer[2] == 0xff && (buffer[3] & 0xf0) == 0xe0)
        {
            if (out != NULL)
            {
                fclose(out);
            }
            sprintf(filename, "%03i.jpg", i);
            out = fopen(filename, "w");
            i++;

        }
        if (out != NULL)
        {
            fwrite(buffer, sizeof(BYTE) * 512, 1, out);
        }

    }
    if (out != NULL)
    {
        fclose(out);
    }
    fclose(f);
    return 0;

    //
}