#include <stdint.h>

double sum4d_all(double *vec2d, int64_t rows,int64_t cols){
    double result=0.0;
    for(int j = 0; j < cols; ++j)
        for(int i = 0; i < rows; ++i)
            printf("---\t %14.5f\n",vec2d[j*rows + i]);
//          printf("---\t %d\n",vec2d[i + j*rows]);
    for(int j = 0; j < cols; ++j)
        for(int i = 0; i < rows; ++i)
            result += vec2d[j*rows + i];

    return(result);
}

void mapsum4d(double *vec2d, int64_t rows, int64_t cols, double *res){
    *res = sum4d_all(vec2d, rows, cols);
}
