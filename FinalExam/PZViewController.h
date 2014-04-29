//
//  PZViewController.h
//  puzzle
//
//  Created by Hansen on 4/28/14.
//  Copyright (c) 2014 Zixuan Huang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PZViewController : UIViewController {
    NSMutableArray *buttons;
    NSInteger numberOfMoves;
}

- (IBAction)shuffle:(id)sender;
- (IBAction)sort:(id)sender;

//@property (strong, nonatomic) IBOutletCollection(UIButton) NSMutableArray *buttons;
@property (weak, nonatomic) IBOutlet UILabel *numberOfMovesLabel;

@end
