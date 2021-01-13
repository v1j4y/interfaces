#include <stdio.h>
#include <math.h>
#include <stdint.h>

double logbinom(float n, float k){
    return(lgamma(n+1)-lgamma(n-k+1)-lgamma(k+1));
}

void binom(float *n, float *k, float *res){
    *res = 0.0;
    *res = (exp(logbinom(*n,*k)));
}
