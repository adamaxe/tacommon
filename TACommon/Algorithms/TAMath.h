/**
 Intermediate anonymous math functions not found in math.h.  Utilize like anonymous functions like those found in math.h

 @author Copyright 2013 Team Axe, LLC. All rights reserved. http://www.teamaxe.org
 @date 01/19/2013
 @file
 */

#define TACommonGCDWithZeroesException @"TACommonGCDWithZeroesException"

/**
 Returns Greatest Common Divisor.  That is, the greatest positive integer that will divide both of the 
 arguments without leaving a remainder.  Uses Euclid's Algorithm: 
 base case: gcd(a,0) = 0;
 recursive case: gcd(a,b) = gcd(b, a mod b);

 Throws TACommonGCDWithZeroesException if both arguments are 0
 Returns Positive GCD even if either/both argument are negative

 @param int argument1 for which to find gcd
 @param int argument2 for which to find gcd
 @return int greatest common divisor for two arguments
 */

extern int gcd(unsigned int, unsigned int);

/**
 Fills an array with prime numbers up to size.  Uses Sieve of Eratosthenes.  Assume all numbers are prime, remove all multiples of every number.
 
 @param int* container array to hold requested primes
 @param size_t number of primes requested 
 */
extern void primes(unsigned int[], size_t);

/**
 Checks whether a number is prime by seeing if number is divisible by any unsigned int between 2 and sqrt(number to check)
 
 @param int number to check
 @return BOOL whether or not requested int was prime
 */
extern BOOL isPrime(unsigned int);

/**
 Fills an array with fibonacci numbers up to size.  

 @param int* container array to hold requested primes
 @param size_t number of primes requested
 */
extern void fibonaccis(unsigned int[], size_t);