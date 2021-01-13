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

double sum_all(int64_t *vec, int64_t len){
    int result=0;
    for(int i = 0; i < len; i++)
        result += vec[i];

    return(result);
}

void mapsum(int64_t *vec, int64_t *len, int64_t *res){
    *res = sum_all(vec, *len);
}
