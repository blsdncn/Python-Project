#include <stdio.h>
#include <stdlib.h>

int main() {
    printf("Running\n");
    FILE *inputFile = fopen("input.txt", "r");
    printf("Opening Input File");
    if (inputFile == NULL) {
        perror("Error opening input.txt\n");
        return 1;
    }

    int value, i = 0;
    while(fscanf(inputFile,"%d",&value) == 1){
        i++;
    }
    int *elements = malloc((i) * sizeof(int));
    if (elements == NULL) {
        perror("Memory allocation failed");
        fclose(inputFile);
        return 1;
    }
    printf("Memory allocated");

    fclose(inputFile);

    inputFile = fopen("input.txt","r");
    printf("Reopening Input File");
    i = 0;
    FILE *imgtxt = fopen("c_output.txt", "w");
    printf("Creating output file\n");
    if (imgtxt == NULL) {
        perror("Error opening c_output.txt");
        free(elements);
        fclose(inputFile);
        return 1;
    }

    // Read values from file and store in memory
    while(fscanf(inputFile, "%d", &value) == 1){
        elements[i++] = value;
    }
    printf("\n");

    // Apply threshold
    for (int j = 0; j < i; j++) {
        if(elements[j] > 170){
            elements[j] = 255;
        } else {
            elements[j] = 0;
        }
    }

    // Print and write the processed elements
    for (int j = 0; j < i; j++) {
        //char temp = (char) elements[j];
        fprintf(imgtxt,"%d ", elements[j]);
        //printf("%d ", elements[j]);
    }
    printf("\n");

    // Free the allocated memory and close files
    fclose(imgtxt);
    fclose(inputFile);
    free(elements);

    return 0;
}
