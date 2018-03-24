#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

struct point {
    double x;
    double y;
};

double distance(const struct point *p) {
    return sqrt(pow(p->x, 2) + pow(p->y, 2));
}

struct point random_point() {
    struct point p;
    p.x = (double)rand() / RAND_MAX;
    p.y = (double)rand() / RAND_MAX;
    return p;
}

struct point *random_points(unsigned int count) {
    struct point *result = malloc(count * sizeof(struct point));
    for (int i = 0; i < count; i++) {
        result[i] = random_point();
    }
    return result;
}

double approximate(unsigned int count) {
    unsigned int in_circle = 0;
    struct point *points = random_points(count);
    for (int i = 0; i < count; i++) {
        if (distance(&points[i]) <= 1) {
            in_circle++;
        }
    }
    return 4 * (float)in_circle / count;
}

int main() {
    srand(time(NULL));
    for (int i = 1; i <= 100000; i++) {
        printf("%6d %f\n", i, approximate(i));
    }
    return EXIT_SUCCESS;
}
