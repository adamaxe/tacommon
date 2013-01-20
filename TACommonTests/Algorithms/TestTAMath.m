#import "TAMath.h"

@interface TestTAMath : SenTestCase {
    
}

@end

@implementation TestTAMath

- (void)testThatGCDOf0And0ThrowsException {

    STAssertThrows(gcd(0,0), @"Exception was not thrown.");
}

- (void)testThatGCDOfNegativeNumbersIsPositive {

    STAssertEquals(gcd(-1,1), 1, @"Negative LHS argument's GCD was not positive.");
    STAssertEquals(gcd(1,-1), 1, @"Negative RHS argument's GCD was not positive.");
}


- (void)testThatGCDOfAnyIntAnd0IsTheInt {

    STAssertEquals(gcd(1,0), 1, @"LHS argument's GCD with 0 did not return 1.");
    STAssertEquals(gcd(0,1), 1, @"RHS argument's GCD with 0 did not return 1.");

}

- (void)testThatGCDOfAnyPositiveIntAnd1Is1 {

    STAssertEquals(gcd(1,1), 1, @"Both 1 arguments' GCD did not return 1.");
    STAssertEquals(gcd(5,1), 1, @"LHS argument's GCD with 1 did not return 1.");
    STAssertEquals(gcd(1,5), 1, @"RHS argument's GCD with 1 did not return 1.");
    
}

- (void)testThatGCDOfPositiveRandomIntsAreCorrect {
    STAssertEquals(gcd(24, 36), 12, nil);
    STAssertEquals(gcd(35, 5), 5, nil);
    STAssertEquals(gcd(48, 18), 6, nil);
    STAssertEquals(gcd(8, 12), 4, nil);

}

- (void)testThatGCDOfTwoPrimesIs1 {
    STAssertEquals(gcd(5, 7), 1, nil);
    STAssertEquals(gcd(1009, 3137), 1, nil);
    STAssertEquals(gcd(43, 1201), 1, nil);

}

- (void)testThatPrimesReturnsNeither0Nor1 {
    int upperLimit = 10;
    unsigned int generatedPrimes[upperLimit];
    primes(generatedPrimes, upperLimit);

    STAssertTrue(generatedPrimes[0] != 0, @"The first prime found was 0.");
    STAssertTrue(generatedPrimes[0] != 1, @"The first prime found was 1.");
}

- (void)testThatPrimesFirstPrimeIs2 {
    int upperLimit = 10;
    unsigned int generatedPrimes[upperLimit];
    primes(generatedPrimes, upperLimit);

    STAssertTrue(generatedPrimes[0] == 2, @"The first prime found was 2.");
}

- (void)testThatPrimesReturnsFirst20NumbersArePrime {
    int upperLimit = 20;
    unsigned int generatedPrimes[upperLimit];
    
    primes(generatedPrimes, upperLimit);

    int actualPrimes[20] = {2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71};
    
    for (int i = 0; i < 20; i++) {
        STAssertTrue(generatedPrimes[i] == actualPrimes[i], @"Prime:%d does not match", i);
    }

}

- (void)testThatPrimesReturnsTheLast10NumbersReturnedOutOf10000ArePrime {
    int upperLimit = 10000;
    unsigned int generatedPrimes[upperLimit];

    primes(generatedPrimes, upperLimit);

    int actualPrimes[10] = {104677,104681,104683,104693,104701,104707,104711,104717,104723,104729};

    for (int i = 0, j = 9990; i < 10; i++, j++) {
        STAssertTrue(generatedPrimes[j] == actualPrimes[i], @"Prime:%d does not match", i);
    }

}

- (void)testThatIsPrimeReturnsFalseFor0 {
    STAssertFalse(isPrime(0), @"0 is not prime");
}

- (void)testThatIsPrimeReturnsFalseFor1 {
    STAssertFalse(isPrime(1), @"0 is not prime");
}

- (void)testThatFibonaccisReturnsFirstAndSecondFibonacciAre0And1 {
    int upperLimit = 2;
    unsigned int generatedFibonacci[upperLimit];

    fibonaccis(generatedFibonacci, upperLimit);

    STAssertTrue(generatedFibonacci[0] == 0, @"Fibonacci: 0  does not match");
    STAssertTrue(generatedFibonacci[1] == 1, @"Fibonacci: 1  does not match");

}

- (void)testThatFibonaccisReturnsFirst20NumbersAreFibonacci {
    int upperLimit = 20;
    unsigned int generatedFibonacci[upperLimit];

    fibonaccis(generatedFibonacci, upperLimit);

    int actualFibonaccis[20] = {0,1,1,2,3,5,8,13,21,34,55,89,144, 233, 377, 610, 987, 1597, 2584, 4181};

    for (int i = 0; i < 20; i++) {
        STAssertTrue(generatedFibonacci[i] == actualFibonaccis[i], @"Fibonacci:%d does not match", generatedFibonacci[i]);
    }
    
}



@end
