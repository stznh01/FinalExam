//
//  SpirographViewController.m
//  Spirograph
//
//  Created by Hansen on 4/28/14.
//  Copyright (c) 2014 Zixuan Huang. All rights reserved.
//

#import "SpirographViewController.h"

@interface SpirographViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation SpirographViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.spirographView.l = 0.3;
    self.spirographView.k = 0.7;
    self.spirographView.numberOfSteps = 2000;
    self.spirographView.stepSize = 0.2;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardAppeared:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWentAway:) name:UIKeyboardWillHideNotification object:nil];
    
}

- (void)keyboardAppeared:(NSNotification *)note {
    CGSize keyboardSize = [[[note userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    CGRect newFrame = self.view.frame;
    newFrame.origin.y -= keyboardSize.height;
    self.view.frame = newFrame;
}

- (void)keyboardWentAway:(NSNotification *)note {
    CGSize keyboardSize = [[[note userInfo] objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    CGRect newFrame = self.view.frame;
    newFrame.origin.y += keyboardSize.height;
    self.view.frame = newFrame;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)viewDidLayoutSubviews {
    [self.scrollView setContentSize:CGSizeMake(560, 280)];
    [self.kSlider setThumbImage:[UIImage imageNamed:@"kimage.png"] forState:UIControlStateNormal];
    [self.lSlider setThumbImage:[UIImage imageNamed:@"limage.png"] forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)redraw:(id)sender {
    int kIntVal = self.kSlider.value * 10;
    self.spirographView.k = kIntVal/10.0;
    int lIntVal = self.lSlider.value * 10;
    self.spirographView.l = lIntVal/10.0;
    self.spirographView.numberOfSteps = [self.numberOfStepsTextField.text intValue];
    self.spirographView.stepSize = [self.stepSizeTextField.text floatValue];
    if ([self.overWriteSegmentControl selectedSegmentIndex] == 0) {
        // overlay
        self.spirographView.overWrite = NO;
    } else {
        self.spirographView.overWrite = YES;
    }
    [self.spirographView setNeedsDisplay];
}
@end
