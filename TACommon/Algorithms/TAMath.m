/**
 Implementation: externalized anonymous functions
 */

#import "TAMath.h"

extern int gcd(int argument1, int argument2) {
    int gcdFinal = 0;

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