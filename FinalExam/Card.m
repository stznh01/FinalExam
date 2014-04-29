//
//  Card.m
//  Practice1
//
//  Created by Hansen on 2/27/14.
//  Copyright (c) 2014 Zixuan Huang. All rights reserved.
//

#import "Card.h"

@implementation Card

- (id) init {
    self = [super init];
    if (self) {
        self.matched = NO;
        self.chosen = NO;
    }
    return self;
}
- (int) match: (Card *)aCard {
    
    //how on earth is this even happening? Why is this true?
    if ([aCard.contents isEqualToString:_contents]) {
        return 1;
    } else {
        return 0;
    }
    
}



@end
