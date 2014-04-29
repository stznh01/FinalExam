//
//  SpirogaphView.h
//  Spirograph
//
//  Created by Hansen on 4/28/14.
//  Copyright (c) 2014 Zixuan Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpirographView : UIView {
    UIView *overWriteView;
    CGFloat lastL,lastK;
}
@property (nonatomic) CGFloat l,k,stepSize;
@property (nonatomic) NSUInteger numberOfSteps;
@property (nonatomic) BOOL overWrite;

@end
