#include <iostream>
using namespace std;

int minimum(int *array, int size)
{
	int min = *array;
	for (int i = 0; i < size; i++)
	{
		if (min > *(array + i))
		{
			min = *(array + i);
		}
	}
	return min;
}

int swapTimesX(int *xptr, int *yptr, int x)
{
	int temp = *xptr;
	*xptr = *yptr * x;
	*yptr = temp * x;
	return *xptr + *yptr;
}

int *doubleArray(int *array, int size)
{
	if (size <= 0)
		return NULL;
	int *newArray = new int[size * 2];
	int i = 0;
	for (i = 0; i < size; i++)
	{
		*(newArray + i) = *(array + i);
	}
	for (i = size; i < size * 2; i++)
	{
		*(newArray + i) = *(array + i- size ) * 2;
	}
	return newArray;
}

int *subArray(int *array, int start, int length)
{
	if (start <= 0 || length<=0)
		return NULL;
	int *result = new int[length];
	for (int i = start; i < (start + length); i++)
	{
		*(result + i - start) = *(array + i);
	}
	return result;
}
