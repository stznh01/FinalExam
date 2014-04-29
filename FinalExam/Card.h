//
//  Card.h
//  Practice1
//
//  Created by Hansen on 2/27/14.
//  Copyright (c) 2014 Zixuan Huang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject
@property (strong,nonatomic) NSString *contents;
@property (nonatomic) BOOL matched;
@property (nonatomic) BOOL chosen;
- (int) match: (Card *)aCard;

@end
