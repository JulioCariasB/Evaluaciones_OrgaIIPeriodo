#include <stdio.h>

void swap(int arr[], int i, int j)
{
    int temp = arr[i];
    arr[i] = arr[j];
    arr[j] = temp;
}

/*  
 * This function takes last element as pivot, places
 * the pivot element at its correct position in sorted
 * array, and places all smaller (smaller than pivot)
 * to left of pivot and all greater elements to right
 * of pivot 
 */
int partition (int arr[], int low, int high)
{
    // pivot (Element to be placed at right position)
    int pivot = arr[high];
 
    int i = (low - 1);  // Index of smaller element

    for (int j = low; j <= high - 1; j++)
    {
        // If current element is smaller than the pivot
        if (arr[j] < pivot)
        {
            i++;    // increment index of smaller element
            swap (arr, i, j);
        }
    }
    swap(arr, i + 1, high);
    
    return (i + 1);
}

int main()
{
    int arr[] = {56, 1, 12, 87, 65, 65, 73, 91, 75, 29, 33, 100, 55};
    int count = sizeof(arr)/sizeof(arr[0]);
    
    int idx = partition(arr, 0, count - 1);
 
    for (int i = 0; i < count; i++)
        printf("%d ", arr[i]);
}
