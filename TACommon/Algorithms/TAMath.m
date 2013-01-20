/**
 Implementation: externalized anonymous functions
 */

#import "TAMath.h"

extern int gcd(int argument1, int argument2) {
    int gcdFinal = 0;

    //Ensure both elements > 0
    //Otherwise, recurse until either the second argument or the modulus of both is 0
    if (argument1 && argument2) {
        gcdFinal = gcd(argument2, argument1%argument2);
    } else if (argument1) {
        gcdFinal = abs(argument1);
    } else if (argument2){
        gcdFinal = abs(argument2);
    } else {
        @throw [NSException exceptionWithName:TACommonGCDWithZeroesException reason:@"Tried to derive GCD of 0 and 0" userInfo:nil];
    }

    return gcdFinal;

}

extern void primes(int locatedPrimes[], size_t size) {

    if (size < 1) {
        return;
    }
    
    locatedPrimes[0] = 2;

    int nextOddNumber = 3;
    int numberOfFoundPrimes = 2;
    BOOL isNextAFactor = YES;

    while (numberOfFoundPrimes <= size) {

        isNextAFactor = NO;
        
        //Ensure that current nextOddNumber is not a multiple of a previous entry
        for (int i = 0; i < numberOfFoundPrimes-1; i++) {
            int nextActualPrime = locatedPrimes[i];
            if (!(nextOddNumber % nextActualPrime)) {
                isNextAFactor = YES;
                break;
            }
        }

        //If no factor was found, nextOddNumber was prime
        if (!isNextAFactor) {
            locatedPrimes[numberOfFoundPrimes-1] = nextOddNumber;
            numberOfFoundPrimes++;
        }

        nextOddNumber += 2;
    }

}