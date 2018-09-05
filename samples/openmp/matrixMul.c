
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/time.h>
#include <pthread.h>
#include <omp.h>
#include <math.h>

typedef double TYPE;
#define MAX_DIM 2000*2000
#define MAX_VAL 10
#define MIN_VAL 1
#define DIM 5

double parallelMultiply(TYPE** matrixA, TYPE** matrixB, TYPE** matrixC, int dimension){

	struct timeval t0, t1;
	gettimeofday(&t0, 0);

	#pragma omp parallel for
	for(int i=0; i<dimension; i++){
		for(int j=0; j<dimension; j++){
			for(int k=0; k<dimension; k++){
				matrixC[i][j] += matrixA[i][k] * matrixB[k][j];
			}
		}
	}

	gettimeofday(&t1, 0);
	double elapsed = (t1.tv_sec-t0.tv_sec) * 1.0f + (t1.tv_usec - t0.tv_usec) / 1000000.0f;

	return elapsed;
}

TYPE** randomSquareMatrix(int dimension){
	/*
		Generate 2 dimensional random TYPE matrix.
	*/

	TYPE** matrix = malloc(dimension * sizeof(TYPE*));

	for(int i=0; i<dimension; i++){
		matrix[i] = malloc(dimension * sizeof(TYPE));
	}

	//Random seed
	srandom(time(0)+clock()+random());

	#pragma omp parallel for
	for(int i=0; i<dimension; i++){
		for(int j=0; j<dimension; j++){
			matrix[i][j] = rand() % MAX_VAL + MIN_VAL;
		}
	}

	return matrix;
}

int main(){

	TYPE** A = randomSquareMatrix(DIM);
	TYPE** B = randomSquareMatrix(DIM);

	TYPE** result = malloc(DIM * sizeof(TYPE*));
	for(int i=0; i<DIM; i++){
		result[i] = malloc(DIM * sizeof(TYPE));
	}

	double elapsed = parallelMultiply(A, B, result, DIM);

	printf("Matrix:\n");
	for(int i=0; i<DIM; i++){
		for(int j=0; j<DIM; j++){
			printf("%d, ", result[i][j]);
		}
		printf("\n");
	}

	printf("Calculated in %d ms\n", elapsed/10);

	return 0;
}

