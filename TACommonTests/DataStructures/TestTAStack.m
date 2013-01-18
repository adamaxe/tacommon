#import "TAStack.h"

@interface TestTAStack : SenTestCase {
    TAStack *testSubject;
}

@end

@implementation TestTAStack

- (void)setUp {
    testSubject = [[TAStack alloc] init];

}

- (void)tearDown {
    
}

- (void)testThatANewStackIsEmpty {

    STAssertEquals([testSubject size], 0U, @"TAStack isn't empty.");
}

- (void)testThatAnEmptyStackPeekReturnsNil {

    STAssertNil([testSubject peek], @"Empty TAStack peek didn't return nil.");

}

- (void)testThatAnEmptyStackPopReturnsNil {

    STAssertNil([testSubject pop], @"Empty TAStack peek didn't return nil.");

}

- (void)testThatAPushToEmptyStackSucceeds {

    NSString *testString = @"testString1";
    [testSubject push:testString];

    STAssertEquals(testSubject.size, 1U, @"TAStack has wrong number of entries.");
}

- (void)testThatSubsequentPushesToNonEmptyStackSucceed {

    NSString *testString1 = @"testString1";
    NSString *testString2 = @"testString2";
    NSString *testString3 = @"testString3";

    [testSubject push:testString1];
    [testSubject push:testString2];
    [testSubject push:testString3];

    STAssertEqualObjects(testString3, [testSubject pop], @"Item at top of Stack is wrong after push.");
    STAssertEquals(testSubject.size, 2U, @"TAStack has wrong number of entries.");

    STAssertEqualObjects(testString2, [testSubject pop], @"Item at top of Stack is wrong after push.");
    STAssertEquals(testSubject.size, 1U, @"TAStack has wrong number of entries.");


}

- (void)testThatSubsequentPopsToNonEmptyStackSucceed {

    NSString *testString1 = @"testString1";
    NSString *testString2 = @"testString2";
    NSString *testString3 = @"testString3";

    [testSubject push:testString1];
    STAssertEquals(testSubject.size, 1U, @"TAStack has wrong number of entries.");

    [testSubject push:testString2];
    STAssertEquals(testSubject.size, 2U, @"TAStack has wrong number of entries.");
    STAssertEqualObjects(testString2, [testSubject peek], @"Item at top of Stack is wrong after push.");

    [testSubject push:testString3];
    STAssertEquals(testSubject.size, 3U, @"TAStack has wrong number of entries.");
    STAssertEqualObjects(testString3, [testSubject peek], @"Item at top of Stack is wrong after push.");
    
}

- (void)testThatPeekOnANonEmptyStackSucceedsAndDoesNotRemoveItem {
    NSString *testString = @"testString1";
    [testSubject push:testString];

    STAssertEqualObjects(testString, [testSubject peek], @"TAStack didn't pop the right object.");
    STAssertEquals(testSubject.size, 1U, @"TAStack has wrong number of entries.");

}

- (void)testThatPopOnANonEmptyStackSucceedsAndDoesRemoveItem {
    NSString *testString = @"testString1";
    [testSubject push:testString];

    STAssertEqualObjects(testString, [testSubject pop], @"TAStack didn't pop the right object.");
    STAssertEquals(testSubject.size, 0U, @"TAStack has wrong number of entries.");
    
}

- (void)testThatIsEmptyIsTrueOnAnEmptyStack {
    STAssertTrue(testSubject.isEmpty, @"Empty TAStack says its not empty.");
}

- (void)testThatIsEmptyIsFalseOnANonEmptyStack {
    NSString *testString = @"testString1";
    [testSubject push:testString];

    STAssertFalse(testSubject.isEmpty, @"Non-Empty TAStack says its empty.");
}

- (void)testThatClearingAnEmptyStackDoesNotThrowException {

    STAssertNoThrow([testSubject clear], @"TAStack could not clear empty stack.");
    
}

- (void)testThatClearingANonEmptyStackRemovesAllItems {

    NSString *testString1 = @"testString1";
    NSString *testString2 = @"testString2";
    NSString *testString3 = @"testString3";

    [testSubject push:testString1];
    [testSubject push:testString2];
    [testSubject push:testString3];

    [testSubject clear];
    STAssertEquals(testSubject.size, 0U, @"TAStack could not clear entries.");
}

- (void)testThatPushingItemsFromAnArrayReversesTheItemOrder {

    NSString *testString1 = @"testString1";
    NSString *testString2 = @"testString2";
    NSString *testString3 = @"testString3";

    NSArray *strings = @[testString1, testString2, testString3];

    [testSubject pushItemsFromArray:strings];

    STAssertEquals(testSubject.size, 3U, @"TAStack could not clear entries.");
    STAssertEqualObjects(testString3, [testSubject pop], @"Last item in Array is not top of stack.");
    STAssertEqualObjects(testString2, [testSubject pop], @"Middle item of array is not middle of stack.");
    STAssertEqualObjects(testString1, [testSubject pop], @"First item of array is not bottom of stack.");

}

- (void)testThatPushingItemsFromAnDictionaryReversesTheItemOrderByKey {

    NSString *testString1 = @"testString1";
    NSString *testString2 = @"testString2";
    NSString *testString3 = @"testString3";

    NSDictionary *strings = @{@"testString2": testString2, @"testString1": testString1, @"testString3": testString3};

    [testSubject pushItemsFromDictionary:strings];

    STAssertEquals(testSubject.size, 3U, @"TAStack could not clear entries.");
    STAssertEqualObjects(testString3, [testSubject pop], @"Last item in Array is not top of stack.");
    STAssertEqualObjects(testString2, [testSubject pop], @"Middle item of array is not middle of stack.");
    STAssertEqualObjects(testString1, [testSubject pop], @"First item of array is not bottom of stack.");
    
}

- (void)testThatPushingItemsFromAnOrderedSetReversesTheItemOrder {

    NSString *testString1 = @"testString1";
    NSString *testString2 = @"testString2";
    NSString *testString3 = @"testString3";

    NSArray *strings = @[testString1, testString2, testString3];
    NSOrderedSet *stringsSet = [[NSOrderedSet alloc] initWithArray:strings];

    [testSubject pushItemsFromOrderedSet:stringsSet];

    STAssertEquals(testSubject.size, 3U, @"TAStack could not clear entries.");
    STAssertEqualObjects(testString3, [testSubject pop], @"Last item in orderedSet is not top of stack.");
    STAssertEqualObjects(testString2, [testSubject pop], @"Middle item of orderedSet is not middle of stack.");
    STAssertEqualObjects(testString1, [testSubject pop], @"First item of orderedSet is not bottom of stack.");
    
}

- (void)testThatPushingItemsFromAStackSetReversesTheItemOrder {

    NSString *testString1 = @"testString1";
    NSString *testString2 = @"testString2";
    NSString *testString3 = @"testString3";

    NSArray *strings = @[testString1, testString2, testString3];

    TAStack *sourceStack = [[TAStack alloc] init];
    [sourceStack pushItemsFromArray:strings];
    [testSubject pushItemsFromStack:sourceStack];

    STAssertEquals(testSubject.size, 3U, @"TAStack could not clear entries.");
    STAssertEqualObjects(testString3, [testSubject pop], @"Last item in orderedSet is not top of stack.");
    STAssertEqualObjects(testString2, [testSubject pop], @"Middle item of orderedSet is not middle of stack.");
    STAssertEqualObjects(testString1, [testSubject pop], @"First item of orderedSet is not bottom of stack.");
    
}

- (void)testThatPushingItemsFromAStackPreservesTheOriginalStack {

    NSString *testString1 = @"testString1";
    NSString *testString2 = @"testString2";
    NSString *testString3 = @"testString3";

    NSArray *strings = @[testString1, testString2, testString3];

    TAStack *sourceStack = [[TAStack alloc] init];
    [sourceStack pushItemsFromArray:strings];
    [testSubject pushItemsFromStack:sourceStack];

    STAssertEquals(sourceStack.size, 3U, @"Original TAStack should not clear entries.");
    
}

@end
