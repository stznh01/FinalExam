//
//  ESView.h
//  Etch-a-Sketch
//
//  Created by Hansen on 4/11/14.
//  Copyright (c) 2014 Zixuan Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ESView : UIView {
    NSMutableArray *points;
    CGPoint currentPoint;
}
@property (nonatomic) CGFloat currentVerticalAngle,currentHorizontalAngle, currentVelocity;
- (void) saveCurrentPoint;
@end
