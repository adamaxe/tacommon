/**
 Implementation: Using NSMutableArray as the container.

 @class TAQueue TAQueue.h
 */

#import "TAQueue.h"

@interface TAQueue ()

@property (nonatomic) NSMutableArray *items;

@end

@implementation TAQueue

- (id) init {
    self = [super init];
    if (self) {
        self.items = [[NSMutableArray alloc] init];
    }

    return self;
}

- (id)copyWithZone:(NSZone *)zone {

    id copy = [[self.class alloc] init];

    [copy enqueueItemsFromArray:self.items];
    
    return copy;
}

- (void) clear {
    [self.items removeAllObjects];
}

- (BOOL) isEmpty {
    return self.items.count == 0;
}

- (id) peek {
    return (self.items.count) ? self.items[0] : nil;
}

- (id) dequeue {

    id dequeuedObject;

    if (self.items.count) {
        dequeuedObject = self.items[0];
        [self.items removeObjectAtIndex:0];
    }

    return dequeuedObject;
}

- (void)enqueue:(id)item {
    [self.items addObject:item];
}

- (void) enqueueItemsFromArray:(NSArray *) items {

    for (id item in items) {
        [self enqueue:item];
    }
}

- (void) enqueueItemsFromDictionary:(NSDictionary *) items {

    NSMutableArray *unsortedItems = (NSMutableArray *)[items allKeys];

    NSArray *sortedItems = [unsortedItems sortedArrayUsingComparator:^(id obj1, id obj2) {
        return [obj1 compare:obj2];
    }];

    for (id item in sortedItems) {
        [self enqueue:item];
    }
}

- (void) enqueueItemsFromOrderedSet:(NSOrderedSet *)items {

    for (id item in items) {
        [self enqueue:item];
    }
}

- (void) enqueueItemsFromQueue:(TAQueue *)items {
    TAQueue *tempQueue = [items copy];

    while (!tempQueue.isEmpty) {
        [self enqueue:[tempQueue dequeue]];
    }
}

- (NSUInteger) size {
    return self.items.count;
}

@end
