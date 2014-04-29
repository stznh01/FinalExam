//
//  CardMatchingGame.m
//  Test1b
//
//  Created by Hansen on 2/28/14.
//  Copyright (c) 2014 Zixuan Huang. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic,readwrite) NSInteger score;
@property (nonatomic) NSMutableArray *cards;
@end
@implementation CardMatchingGame

// Borrowed from kickstarter...
#define MISMATCH_PENALTY 2
#define COST_TO_CHOOSE 1
#define MATCH_BONUS 4

- (NSMutableArray *) cards {
    if (!_cards) {
        _cards = [[NSMutableArray alloc]init];
    }
    return _cards;
}

- (instancetype) initWithCardCount:(NSUInteger)count usingDeck:(PlayingCardDeck *)deck {
    //Why instancetype instead of id? Have we not use id in the past?
    self = [super init];
    if (self) {
        _cards = [self cards]; // Myles helped...
        for (int i = 0; i < count; i++) {
            [_cards addObject:[deck drawRandomCard]];
        }
    }
    return self;
}

- (void) chooseCardAtIndex:(NSUInteger)index {
    PlayingCard *thisCard = [_cards objectAtIndex:index];
    if (!thisCard.matched) {
        if (thisCard.chosen) {
            //if the card is chosen turn it back
            [thisCard setChosen:NO];
        } else {
            //if it's not chosen choose it
            for (PlayingCard *otherCard in _cards) {
                if (otherCard.chosen && !otherCard.matched) {
                    // Check to see if the two card are a match...
                    int matchScore = [thisCard match:@[otherCard]];
                    if (matchScore) {
                        _score += matchScore * MATCH_BONUS;
                        otherCard.matched = YES;
                        thisCard.matched = YES;
                    } else {
                        [self mismatchPenalty];
                        otherCard.chosen = NO;
                    }
                    break;
                }
            }
            [self flipCost];
            thisCard.chosen = YES;
        }
    }
}

- (PlayingCard *) pickOneCard:(NSUInteger)index {
    return [_cards objectAtIndex:index];
}

- (void) flipCost {
    _score -= COST_TO_CHOOSE;
}

- (void) mismatchPenalty {
    _score -= MISMATCH_PENALTY;
}


@end




