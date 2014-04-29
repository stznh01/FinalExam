//
//  ESViewController.h
//  Etch-a-Sketch
//
//  Created by Hansen on 4/11/14.
//  Copyright (c) 2014 Zixuan Huang. All rights reserved.
//

#import <UIKit/UIKit.h> 
#import "ESView.h"

@interface ESViewController : UIViewController {
    CGFloat lastVelocity;
}
@property (nonatomic, weak) IBOutlet ESView *esView;
- (IBAction)addHorizontal:(id)sender;
- (IBAction)addVertical:(id)sender;
@end
