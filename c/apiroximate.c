#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <complex.h>

double complex random_point() {
    double x = (double)rand() / RAND_MAX;
    double y = (double)rand() / RAND_MAX;
    return x + y * I;
}

double complex *random_points(unsigned int count) {
    double complex *result = malloc(count * sizeof(double complex));
    for (int i = 0; i < count; i++) {
        result[i] = random_point();
    }
    return result;
}

double approximate(unsigned int count) {
    unsigned int in_circle = 0;
    double complex *points = random_points(count);
    for (int i = 0; i < count; i++) {
        if (cabs(points[i]) <= 1) {
            in_circle++;
        }
    }
    return 4 * (double)in_circle / count;
}

int main() {
    srand(time(NULL));
    for (int i = 1; i <= 100000; i++) {
        printf("%6d %f\n", i, approximate(i));
    }
    return EXIT_SUCCESS;
}
