//
//  CardMatchingGame.h
//  Test1b
//
//  Created by Hansen on 2/28/14.
//  Copyright (c) 2014 Zixuan Huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@interface CardMatchingGame : NSObject
@property (nonatomic, readonly) NSInteger score;

- (instancetype) initWithCardCount: (NSUInteger)count usingDeck:(PlayingCardDeck *)deck;
- (void) chooseCardAtIndex: (NSUInteger)index;
- (PlayingCard *) pickOneCard: (NSUInteger)index;
@end
