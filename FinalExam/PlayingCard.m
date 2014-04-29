//
//  PlayingCard.m
//  Practice1
//
//  Created by Hansen on 2/28/14.
//  Copyright (c) 2014 Zixuan Huang. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard
@synthesize suit = _suit;

- (void) setSuit:(NSString *)suit {
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

+ (NSArray *) validSuits {
    return @[@"♥", @"♦", @"♠",@"♣"]; // Chosen character not displaying
    //return @[@"♥️",@"♣️",@"♠️",@"♦️"];
    //Above line taken from Prof. Toth
}

- (NSString *) suit {// The getter without "get"
    return _suit ? _suit : @"?";
}
// Kinda confused about rankStrings as a factory method - the handout was unclear
/*
- (NSString *) rankStrings: (int)rank {
    // Says "return string" but Prof's code says return NSArray?!
    NSArray *ranks = @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
    return [ranks objectAtIndex:rank];
}
 */

+ (NSArray *) rankStrings {
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

- (NSString *) contents {
    NSArray *thisRank = [PlayingCard rankStrings];
    //return [NSString stringWithFormat:@"%@, %@", [thisRank objectAtIndex:*(_rank)], _suit];
    NSArray *cardContents = thisRank;
    return [[cardContents objectAtIndex:[self rank]] stringByAppendingString:self.suit];
}

+ (NSUInteger) maxRank {
    return [[self rankStrings] count] - 1;
    // Why max is not itself but a lower rank?
}

- (void) setRank:(NSUInteger) rank {
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}
// A new implementation of match from Prof.Toth
- (int) match:(NSArray *)cardList {
    int score = 0;
    if ([cardList count] == 1) {
        PlayingCard *compCard = [cardList firstObject];
        if ([_suit isEqualToString:compCard.suit]) {
            score = 1;
        } else if (_rank == compCard.rank) {
            score = 4;
        }
    }
    return score;
}
@end





