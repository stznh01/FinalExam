//
//  Deck.m
//  Practice1
//
//  Created by Hansen on 2/27/14.
//  Copyright (c) 2014 Zixuan Huang. All rights reserved.
//

#import "Deck.h"
@interface Deck()
@property (strong,nonatomic) NSMutableArray *cards;
// Must cards be declared here and must it be strong?
@end

@implementation Deck
- (id) init {
    self = [super init];
    if (self) {
        [self cards];
    }
    return self;
}
- (NSMutableArray *)cards {
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}
- (void) addCard: (Card *)aCard atTop: (BOOL)atTop {
    if (atTop) {
        [_cards insertObject: aCard atIndex:0];
    } else {
        [_cards addObject: aCard];
    }
}
- (void) addCard: (Card *)aCard {
    [_cards addObject: aCard];
}
- (Card *) drawRandomCard {
    Card *cardToDraw;
    if ([_cards count]) {
        unsigned cardNum = arc4random() % _cards.count;
        //Unsigned for index not going beyong bounds
        //NSLog([NSString stringWithFormat:@"%d", cardNum]);
        cardToDraw = [_cards objectAtIndex:cardNum];
        [_cards removeObject:cardToDraw];
    }
    return cardToDraw;
}
@end
