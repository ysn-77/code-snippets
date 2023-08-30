
function createCountHash(array) {
    const countHash = {};
    
    array.forEach( number => {
        if(countHash[number] == undefined) {
            countHash[number] = 1;
        } else {
            countHash[number] += 1;
        }
    });
    
    return countHash;
}


function solution(k, a) {
    const totalSum = k;
    const array = a;
    
    const countHash = createCountHash(array);
    let countOfUniquePairs = 0;
        
    array.forEach( number => {
        const x = totalSum - number;
        if(
            countHash[x] != undefined &&
            (x != number || countHash[x] >= 2)
        ) {
            countOfUniquePairs++;
            countHash[x] = undefined;
            countHash[number] = undefined;
        }
    });
    
    return countOfUniquePairs;
}
