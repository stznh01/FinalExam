//
//  ViewController.h
//  Test1b
//
//  Created by Hansen on 2/28/14.
//  Copyright (c) 2014 Zixuan Huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardMatchingGame.h"

@interface ViewController : UIViewController {
    CardMatchingGame *game;
}
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cards;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
- (IBAction)restart:(id)sender;
- (IBAction)chooseCard:(UIButton *)sender;

@end
