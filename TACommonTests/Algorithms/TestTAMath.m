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

- (void)testThatGCDOfTwoPrimesAre1 {
    STAssertEquals(gcd(5, 7), 1, nil);
    STAssertEquals(gcd(1009, 3137), 1, nil);
    STAssertEquals(gcd(43, 1201), 1, nil);

}


@end
