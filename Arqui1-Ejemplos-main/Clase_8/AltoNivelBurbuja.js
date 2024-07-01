
//El metodo de ordenamiento de asembler esta basado en este
//variable por variable linea por linea, para que miren como funciona
//Y que se puede pasar de alto nivel a bajo nivel de ser necesario.
function bubbleSort(arr) {
    let swapped = true;
    let endIndex = arr.length - 1;

    while (swapped) {
        swapped = false;
        let currentIndex = 0;

        while (currentIndex < endIndex) {
            if (arr[currentIndex] < arr[currentIndex + 1]) {
                // Swap elements
                let temp = arr[currentIndex];
                arr[currentIndex] = arr[currentIndex + 1];
                arr[currentIndex + 1] = temp;

                swapped = true;
            }
            currentIndex++;
        }

        endIndex--;
    }

    return arr;
}

// Ejemplo de uso:
const arr = [64, 34, 25, 12, 22, 11, 90];
console.log("Array antes de ordenar: " + arr);
console.log("Array después de ordenar: " + bubbleSort(arr));