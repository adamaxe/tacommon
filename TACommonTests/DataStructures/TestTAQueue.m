#import "TAQueue.h"

@interface TestTAQueue : SenTestCase {
    TAQueue *testSubject;
}

@end

@implementation TestTAQueue

- (void)setUp {
    testSubject = [[TAQueue alloc] init];

}

- (void)tearDown {
    
}

- (void)testThatANewQueueIsEmpty {

    STAssertEquals([testSubject size], 0U, @"TAQueue isn't empty.");
}

- (void)testThatAnEmptyQueuePeekReturnsNil {

    STAssertNil([testSubject peek], @"Empty TAQueue peek didn't return nil.");

}

- (void)testThatAnEmptyQueueDequeueReturnsNil {

    STAssertNil([testSubject dequeue], @"Empty TAQueue peek didn't return nil.");

}

- (void)testThatAEnqueueToEmptyQueueSucceeds {

    NSString *testString = @"testString1";
    [testSubject enqueue:testString];

    STAssertEquals(testSubject.size, 1U, @"TAQueue has wrong number of items.");
}

- (void)testThatSubsequentEnqueuesToNonEmptyQueueSucceed {

    NSString *testString1 = @"testString1";
    NSString *testString2 = @"testString2";
    NSString *testString3 = @"testString3";

    [testSubject enqueue:testString1];
    [testSubject enqueue:testString2];
    [testSubject enqueue:testString3];

    STAssertEqualObjects(testString1, [testSubject dequeue], @"Item at front of Queue is wrong after dequeue.");
    STAssertEquals(testSubject.size, 2U, @"TAQueue has wrong number of items.");

    STAssertEqualObjects(testString2, [testSubject dequeue], @"Item at front of Queue is wrong after dequeue.");
    STAssertEquals(testSubject.size, 1U, @"TAQueue has wrong number of items.");


}

- (void)testThatSubsequentDequeuesToNonEmptyQueueSucceed {

    NSString *testString1 = @"testString1";
    NSString *testString2 = @"testString2";
    NSString *testString3 = @"testString3";

    [testSubject enqueue:testString1];
    STAssertEquals(testSubject.size, 1U, @"TAQueue has wrong number of items.");

    [testSubject enqueue:testString2];
    STAssertEquals(testSubject.size, 2U, @"TAQueue has wrong number of items.");
    STAssertEqualObjects(testString1, [testSubject peek], @"Item at front of Queue is wrong after dequeue.");

    [testSubject enqueue:testString3];
    STAssertEquals(testSubject.size, 3U, @"TAQueue has wrong number of items.");
    STAssertEqualObjects(testString1, [testSubject peek], @"Item at front of Queue is wrong after enqueue.");
    
}

- (void)testThatPeekOnANonEmptyQueueSucceedsAndDoesNotRemoveItem {
    NSString *testString = @"testString1";
    [testSubject enqueue:testString];

    STAssertEqualObjects(testString, [testSubject peek], @"TAQueue didn't pop the right object.");
    STAssertEquals(testSubject.size, 1U, @"TAQueue has wrong number of items.");

}

- (void)testThatDequeueOnANonEmptyQueueSucceedsAndDoesRemoveItem {
    NSString *testString = @"testString1";
    [testSubject enqueue:testString];

    STAssertEqualObjects(testString, [testSubject dequeue], @"TAQueue didn't pop the right object.");
    STAssertEquals(testSubject.size, 0U, @"TAQueue has wrong number of items.");
    
}

- (void)testThatIsEmptyIsTrueOnAnEmptyQueue {
    STAssertTrue(testSubject.isEmpty, @"Empty TAQueue says its not empty.");
}

- (void)testThatIsEmptyIsFalseOnANonEmptyQueue {
    NSString *testString = @"testString1";
    [testSubject enqueue:testString];

    STAssertFalse(testSubject.isEmpty, @"Non-Empty TAQueue says its empty.");
}

- (void)testThatClearingAnEmptyQueueDoesNotThrowException {

    STAssertNoThrow([testSubject clear], @"TAQueue could not clear empty queue.");
    
}

- (void)testThatClearingANonEmptyQueueRemovesAllItems {

    NSString *testString1 = @"testString1";
    NSString *testString2 = @"testString2";
    NSString *testString3 = @"testString3";

    [testSubject enqueue:testString1];
    [testSubject enqueue:testString2];
    [testSubject enqueue:testString3];

    [testSubject clear];
    STAssertEquals(testSubject.size, 0U, @"TAQueue could not clear items.");
}

- (void)testThatEnqueueingItemsFromAnArrayPreservesTheItemOrder {

    NSString *testString1 = @"testString1";
    NSString *testString2 = @"testString2";
    NSString *testString3 = @"testString3";

    NSArray *strings = @[testString1, testString2, testString3];

    [testSubject enqueueItemsFromArray:strings];

    STAssertEquals(testSubject.size, 3U, @"TAQueue could not clear items.");
    STAssertEqualObjects(testString1, [testSubject dequeue], @"1st item in Array is not front of queue.");
    STAssertEqualObjects(testString2, [testSubject dequeue], @"Middle item of array is not middle of queue.");
    STAssertEqualObjects(testString3, [testSubject dequeue], @"Last item of array is not tail of queue.");

}

- (void)testThatEnqueueingItemsFromAnDictionaryPreservesTheItemOrderByKey {

    NSString *testString1 = @"testString1";
    NSString *testString2 = @"testString2";
    NSString *testString3 = @"testString3";

    NSDictionary *strings = @{@"testString2": testString2, @"testString1": testString1, @"testString3": testString3};

    [testSubject enqueueItemsFromDictionary:strings];

    STAssertEquals(testSubject.size, 3U, @"TAQueue could not clear items.");
    STAssertEqualObjects(testString1, [testSubject dequeue], @"First item in Array is not front of queue.");
    STAssertEqualObjects(testString2, [testSubject dequeue], @"Middle item of array is not middle of queue.");
    STAssertEqualObjects(testString3, [testSubject dequeue], @"Last item of array is not tail of queue.");
    
}

- (void)testThatEnqueueingItemsFromAnOrderedSetPreservesTheItemOrder {

    NSString *testString1 = @"testString1";
    NSString *testString2 = @"testString2";
    NSString *testString3 = @"testString3";

    NSArray *strings = @[testString1, testString2, testString3];
    NSOrderedSet *stringsSet = [[NSOrderedSet alloc] initWithArray:strings];

    [testSubject enqueueItemsFromOrderedSet:stringsSet];

    STAssertEquals(testSubject.size, 3U, @"TAQueue could not clear items.");
    STAssertEqualObjects(testString1, [testSubject dequeue], @"1st item in orderedSet is not front of queue.");
    STAssertEqualObjects(testString2, [testSubject dequeue], @"Middle item of orderedSet is not middle of queue.");
    STAssertEqualObjects(testString3, [testSubject dequeue], @"Last item of orderedSet is not tail of queue.");
    
}

- (void)testThatEnqueueingItemsFromAQueuePreservesTheItemOrder {

    NSString *testString1 = @"testString1";
    NSString *testString2 = @"testString2";
    NSString *testString3 = @"testString3";

    NSArray *strings = @[testString1, testString2, testString3];

    TAQueue *sourceQueue = [[TAQueue alloc] init];
    [sourceQueue enqueueItemsFromArray:strings];
    [testSubject enqueueItemsFromQueue:sourceQueue];

    STAssertEquals(testSubject.size, 3U, @"TAQueue could not clear entries.");
    STAssertEqualObjects(testString1, [testSubject dequeue], @"1st item in orderedSet is not front of queue.");
    STAssertEqualObjects(testString2, [testSubject dequeue], @"Middle item of orderedSet is not middle of queue.");
    STAssertEqualObjects(testString3, [testSubject dequeue], @"Last item of orderedSet is not tail of queue.");
    
}

- (void)testThatEnqueueingItemsFromAQueuePreservesTheOriginalQueue {

    NSString *testString1 = @"testString1";
    NSString *testString2 = @"testString2";
    NSString *testString3 = @"testString3";

    NSArray *strings = @[testString1, testString2, testString3];

    TAQueue *sourceQueue = [[TAQueue alloc] init];
    [sourceQueue enqueueItemsFromArray:strings];
    [testSubject enqueueItemsFromQueue:sourceQueue];

    STAssertEquals(sourceQueue.size, 3U, @"Original TAQueue should not clear entries.");
    
}

@end
