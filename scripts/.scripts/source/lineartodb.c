#include <stdio.h>
#include <stdlib.h>
#include <math.h>
 
int main(int argc, char *argv[])
{
    int i = 1;
    char temp;
    double linear_value = 0;
    double db_value = 0;

    for (i = 1; i < argc; i++)
    {
        linear_value = atof(argv[i]);
        db_value = 10 * log10(linear_value);
        printf("%.2f dB\n", db_value);
    }
    return 0;
}
