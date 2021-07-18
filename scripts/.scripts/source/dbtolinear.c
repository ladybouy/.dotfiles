#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main(int argc, char *argv[])
{
    int i;
    double db_value = 0;
    double linear_value = 0;

    for (i = 1; i < argc; i++)
    {
        db_value = atof(argv[i]);
        linear_value = pow(10, db_value / 10);
        printf("%.6f\n", linear_value);
    }
    return 0;
}
