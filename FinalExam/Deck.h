//
//  Deck.h
//  Practice1
//
//  Created by Hansen on 2/27/14.
//  Copyright (c) 2014 Zixuan Huang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void) addCard: (Card *)aCard atTop: (BOOL)atTop;
- (void) addCard: (Card *)aCard;
- (Card *) drawRandomCard;
@end
