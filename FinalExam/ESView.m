//
//  ESView.m
//  Etch-a-Sketch
//
//  Created by Hansen on 4/11/14.
//  Copyright (c) 2014 Zixuan Huang. All rights reserved.
//

#import "ESView.h"

@implementation ESView
@synthesize currentHorizontalAngle = _currentHorizontalAngle;
@synthesize currentVerticalAngle = _currentVerticalAngle;
@synthesize currentVelocity = _currentVelocity;

- (void) setCurrentVelocity:(CGFloat)currentVelocity {
    if (currentVelocity > 0 && _currentVelocity < 0) {
        [self saveCurrentPoint];
    }
    if (currentVelocity < 0 && _currentVelocity > 0) {
        [self saveCurrentPoint];
    }
    _currentVelocity = currentVelocity;
}

- (void) setCurrentHorizontalAngle:(CGFloat)currentHorizontalAngle {
    _currentHorizontalAngle = currentHorizontalAngle;
    [self setNeedsDisplay];
}

- (void) setCurrentVerticalAngle:(CGFloat)currentVerticalAngle {
    _currentVerticalAngle = currentVerticalAngle;
    [self setNeedsDisplay];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        points = [[NSMutableArray alloc] init];
        [points addObject:[NSValue valueWithCGPoint:CGPointMake(100, 100)]];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Initialization code
        points = [[NSMutableArray alloc] init];
        [points addObject:[NSValue valueWithCGPoint:CGPointMake(140, 190)]];
    }
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];


    return self;
}


- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if ( event.subtype == UIEventSubtypeMotionShake )
    {
        // Put in code here to handle shake
        [points removeAllObjects];
        [points addObject:[NSValue valueWithCGPoint:currentPoint]];
        [self setNeedsDisplay];
    }
    
    if ( [super respondsToSelector:@selector(motionEnded:withEvent:)] )
        [super motionEnded:motion withEvent:event];
}

- (BOOL)canBecomeFirstResponder
{ return YES; }


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    
    UIBezierPath *bz = [[UIBezierPath alloc] init];
    [bz setLineWidth:3.0];
    [[UIColor blackColor] setStroke];
    [bz moveToPoint:[[points firstObject] CGPointValue]];
    for (id p in points) {
        [bz addLineToPoint:[p CGPointValue]];
    }
    CGPoint lastPoint = [[points lastObject] CGPointValue];
    currentPoint = CGPointMake(lastPoint.x + self.currentHorizontalAngle*10.0, lastPoint.y + self.currentVerticalAngle*10.0);
    if (currentPoint.x < 0) {
        currentPoint.x = 0;
    }
    if (currentPoint.y < 0) {
        currentPoint.y = 0;
    }
    if (currentPoint.x > self.bounds.size.width) {
        currentPoint.x = self.bounds.size.width;
    }
    if (currentPoint.y > self.bounds.size.height) {
        currentPoint.y = self.bounds.size.height;
    }
    [bz addLineToPoint:currentPoint];
    [self saveCurrentPoint];
    [bz stroke];
    
    [self drawCurrentPoint];
}

- (void)drawCurrentPoint {
    [[UIColor whiteColor] setStroke];
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path moveToPoint:currentPoint];
    [path setLineWidth:4];
    CGPoint p = CGPointMake(currentPoint.x-2, currentPoint.y-2);
    [path addLineToPoint:p];
    p.x += 4.0;
    [path addLineToPoint:p];
    p.y += 4.0;
    [path addLineToPoint:p];
    p.x -= 4.0;
    [path addLineToPoint:p];
    [path stroke];
}

-(void)saveCurrentPoint {
    [points addObject:[NSValue valueWithCGPoint:currentPoint]];
    self.currentVerticalAngle = 0;
    self.currentHorizontalAngle = 0;
    self.currentVelocity = 0;
    
}

@end
