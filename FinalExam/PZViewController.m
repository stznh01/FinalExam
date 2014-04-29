//
//  PZViewController.m
//  puzzle
//
//  Created by Michael Toth on 6/18/13.
//  Copyright (c) 2013 Michael Toth. All rights reserved.
//

#import "PZViewController.h"

@interface PZViewController ()

@end

@implementation PZViewController
@synthesize numberOfMovesLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self sort:nil];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void) sort:(id)sender {
    buttons = [[NSMutableArray alloc] init];
    NSArray *imageNames = [NSArray arrayWithObjects:@"one.jpg",@"two.jpg",@"three.jpg",@"four.jpg",@"five.jpg",@"six.jpg",@"seven.jpg",@"eight.jpg",@"nine.jpg",@"ten.jpg",@"eleven.jpg",@"twelve.jpg",@"thirteen.jpg",@"fourteen.jpg",@"fifteen.jpg",@"blank.jpg", nil];
//    NSArray *labelNames = [NSArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15", nil];
    
    self.numberOfMovesLabel.text = @"Number of moves: 0";
    numberOfMoves = 0;
    int i=0;
    for (i=0; i<16; i++) {
        UIImage *blankImage = [UIImage imageNamed:@"blank.jpg"];
        UIImageView *blankImageView = [[UIImageView alloc] initWithImage:blankImage];
        blankImageView.frame = CGRectMake(56+((i%4)*52), 75+((i/4)*52), 52, 52);
        [self.view addSubview:blankImageView];
    }
    for (i=0;i<15;i++) {
        UIButton *b = [[UIButton alloc] initWithFrame:CGRectMake(56 +((i%4)*52), 75+((i/4)*52), 52, 52)];
        [b setImage:[UIImage imageNamed:[imageNames objectAtIndex:i]] forState:UIControlStateNormal];
        [b addTarget:self action:@selector(move:) forControlEvents:UIControlEventTouchUpInside];
        
        [buttons addObject:b];
        [self.view addSubview:b];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)shuffle:(id)sender {
    NSMutableArray *randomizedArray = [[NSMutableArray alloc] init];
    int unStruck = 15;
    int buttonCount = 0;
    while (unStruck>0) {
        int i = (arc4random() % unStruck);
        CGRect frame = CGRectMake(56 + ((buttonCount%4)*52), 75+((buttonCount/4)*52), 52, 52);
        UIButton *button = [buttons objectAtIndex:i];
        [button removeFromSuperview];
        button.frame = frame;
        //button.titleLabel.frame = frame;
        [self.view addSubview:button];
        [randomizedArray addObject:button];
        [buttons removeObjectAtIndex:i];
        buttonCount++;
        unStruck = unStruck - 1;
    }
    buttons = randomizedArray;
    randomizedArray = nil;
    numberOfMoves = 0;
    self.numberOfMovesLabel.text = [NSString stringWithFormat:@"Number of moves: 0"];
}

// borrowed this method mostly from Dr. Toth, got stuck with the function
- (IBAction)move:(id)sender {
    BOOL left=true;
    BOOL right= true;
    BOOL up=true;
    BOOL down=true;
    
    UIButton *pressedButton = sender;
    if (pressedButton.frame.origin.x == 56) {
        left=false;
    }
    if (pressedButton.frame.origin.x == 212) {
        right=false;
    }
    if (pressedButton.frame.origin.y == 75) {
        up=false;
    }
    if (pressedButton.frame.origin.y == 231) {
        down=false;
    }
    for (UIButton *b in buttons) {
        if (b.frame.origin.x == pressedButton.frame.origin.x-52 &&
            b.frame.origin.y == pressedButton.frame.origin.y)
            left = false;
        if (b.frame.origin.x == pressedButton.frame.origin.x+52 &&
            b.frame.origin.y == pressedButton.frame.origin.y)
            right = false;
        if (b.frame.origin.x == pressedButton.frame.origin.x &&
            b.frame.origin.y == pressedButton.frame.origin.y-52 )
            up = false;
        if (b.frame.origin.x == pressedButton.frame.origin.x &&
            b.frame.origin.y == pressedButton.frame.origin.y+52)
            down = false;
    }
    if (left) {

        CGRect newFrame = CGRectMake(pressedButton.frame.origin.x-52, pressedButton.frame.origin.y, 52, 52);
        [UIView animateWithDuration:0.5 animations:^{
            pressedButton.frame = newFrame;
        }];
        numberOfMoves++;
    }
    if (right) {
        CGRect newFrame = CGRectMake(pressedButton.frame.origin.x+52, pressedButton.frame.origin.y, 52, 52);
        [UIView animateWithDuration:0.5 animations:^{
            pressedButton.frame = newFrame;
        }];
        numberOfMoves++;
    }
    if (up) {
        CGRect newFrame = CGRectMake(pressedButton.frame.origin.x, pressedButton.frame.origin.y-52, 52, 52);
        [UIView animateWithDuration:0.5 animations:^{
            pressedButton.frame = newFrame;
        }];
        numberOfMoves++;
    }
    if (down) {
        CGRect newFrame = CGRectMake(pressedButton.frame.origin.x, pressedButton.frame.origin.y+52, 52, 52);
        [UIView animateWithDuration:0.5 animations:^{
            pressedButton.frame = newFrame;
        }];
        numberOfMoves++;
    }
    self.numberOfMovesLabel.text = [NSString stringWithFormat:@"Number of moves: %ld",(long)numberOfMoves];
}


@end
