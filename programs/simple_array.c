#include <stdio.h>

int main(int argc, char *argv[]) {
    
    int arr1[5] = {1, 2, 3, 4, 5};
    int arr2[5] = {0, 0, 0, 0, 0};

    printf("%d\n", arr1[arr2[0]]);

}