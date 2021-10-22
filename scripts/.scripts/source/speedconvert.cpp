#include <iostream>
#include <cstring>
#include <string>

double KnotsToMPH(double* aKnot)
{
    double mph = 6076.0 / 5280.0 * (*aKnot);
    return mph;
}
double MPHtoKnots(double* aMph)
{
    double knots = 5280.0 / 6076.0 * (*aMph);
    return knots;
}

double KnotsToKPH(double* aKnot)
{
    double kph = 1.852 * (*aKnot);
    return kph;
}

double KPHtoKnots(double* aKph)
{
    double knots = *aKph / 1.852;
    return knots;
}

double KnotsToMPS(double* aKnot)
{
    double MPS = 1852.0 / 3600.0 * (*aKnot);
    return MPS;
}



int main(int argc, char** argv)
{
    if (argc < 2) 
    {
        std::cout << "Usage: " << argv[0] << " [OPTION]...VALUE" << '\n';
        exit(0);
    }
}
