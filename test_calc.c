#include <stdio.h>
#include <stdlib.h>
#include <math.h>

int main()
{
    int i;
    float xn =0 ;
    float fx = xn-1;
    float ffx = xn-1;
    
for (size_t i = 0; i < 6; i++)
{
    xn = (xn - 1) - fx/ffx;
    xn++;
    printf("%f", xn);
}
    return 0;
}
