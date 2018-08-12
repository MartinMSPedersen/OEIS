#include <stdlib.h>
#include <stdio.h>
#include <math.h>

#define SIZE 1000

unsigned int numbers[SIZE];

int main() {
	unsigned int pointer=0, 
		     next=1, 
		     circle_count=1, 
		     next_circle_number=2, 
		     sqrt_non_circle=1;

	numbers[0]=1; 
	printf("1");

	while (next<SIZE) {
		if (circle_count==sqrt_non_circle) {
			numbers[next]=numbers[pointer]; 
			circle_count=0; 
			pointer++;
			sqrt_non_circle=sqrt(numbers[pointer]);
		} else {
			circle_count++; 
			numbers[next]=next_circle_number;
			next_circle_number++;
		}
		printf(", %u", numbers[next]); 
		next++;
	}
	printf("\n");
	return EXIT_SUCCESS;
}
