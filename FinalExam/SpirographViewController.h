//
//  SpirographViewController.h
//  Spirograph
//
//  Created by Hansen on 4/28/14.
//  Copyright (c) 2014 Zixuan Huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpirographView.h"
#import "HarmonigraphView.h"

@interface SpirographViewController : UIViewController <UITextFieldDelegate> 
@property (weak, nonatomic) IBOutlet HarmonigraphView *harmonigraphView;
@property (weak, nonatomic) IBOutlet UISlider *lSlider;
@property (weak, nonatomic) IBOutlet UISlider *kSlider;
@property (weak, nonatomic) IBOutlet SpirographView *spirographView;
@property (weak, nonatomic) IBOutlet UITextField *stepSizeTextField;
@property (weak, nonatomic) IBOutlet UITextField *numberOfStepsTextField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *overWriteSegmentControl;
- (IBAction)redraw:(id)sender;

@end
