//
//  ESViewController.m
//  Etch-a-Sketch
//
//  Created by Hansen on 4/11/14.
//  Copyright (c) 2014 Zixuan Huang. All rights reserved.
//

#import "ESViewController.h"

@interface ESViewController ()

@end

@implementation ESViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    lastVelocity = 0;
	// Do any additional setup after loading the view, typically from a nib.
    
}

- (IBAction)addHorizontal:(id)sender {
    UIRotationGestureRecognizer *s = sender;
    NSLog(@"%f radians horizontal",s.rotation);
    if (lastVelocity > 0 && s.velocity < 0) {
        [self.esView saveCurrentPoint];
    }
    if (lastVelocity < 0 && s.velocity > 0) {
        [self.esView saveCurrentPoint];
    }
    [self.esView setCurrentHorizontalAngle:s.rotation];
    [self.esView setCurrentVelocity:s.velocity];
    if (s.state == UIGestureRecognizerStateEnded) {
        [self.esView saveCurrentPoint];
    }
    lastVelocity = s.velocity;
}

- (IBAction)addVertical:(id)sender {
    UIRotationGestureRecognizer *s = sender;
    NSLog(@"%f velocity",s.velocity);
    if (lastVelocity > 0 && s.velocity < 0) {
        [self.esView saveCurrentPoint];
    }
    if (lastVelocity < 0 && s.velocity > 0) {
        [self.esView saveCurrentPoint];
    }
    [self.esView setCurrentVerticalAngle:s.rotation];
    [self.esView setCurrentVelocity:s.velocity];
    if (s.state == UIGestureRecognizerStateEnded) {
        [self.esView saveCurrentPoint];
    }
    lastVelocity = s.velocity;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
