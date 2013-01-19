/**
 Intermediate anonymous math functions not found in math.h.  Utilize like anonymous functions like those found in math.h

 @author Copyright 2013 Team Axe, LLC. All rights reserved. http://www.teamaxe.org
 @date 01/19/2013
 @file
 */

#define TACommonGCDWithZeroesException @"TACommonGCDWithZeroesException"

/**
 Returns greatest common divisor.  That is, the greatest positive integer that will divide both of the 
 arguments without leaving a remainder.  Uses Euclid's Algorithm: 
 base case: gcd(a,0) = 0;
 recursive case: gcd(a,b) = gcd(b, a mod b);

 Throws TACommonGCDWithZeroesException if both arguments are 0
 Returns Positive GCD even if either/both argument are negative

 @param int argument1 for which to find gcd
 @param int argument2 for which to find gcd
 @return int greatest common divisor for two arguments
 */

extern int gcd(int, int);