//
//  ViewController.m
//  Test1b
//
//  Created by Hansen on 2/28/14.
//  Copyright (c) 2014 Zixuan Huang. All rights reserved.
//

#import "ViewController.h"

#import "Deck.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    game = [[CardMatchingGame alloc] initWithCardCount:16 usingDeck:[[PlayingCardDeck alloc] init]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)restart:(id)sender {
    game = [[CardMatchingGame alloc] initWithCardCount:16 usingDeck:[[PlayingCardDeck alloc] init]];
    for (UIButton *b in _cards) {
        if (b.titleLabel.text) {
            b.titleLabel.text = nil;
            [b setTitle:nil forState:UIControlStateNormal];
            [b setBackgroundImage:[UIImage imageNamed:@"morback.png"] forState:UIControlStateNormal];
        }
        b.enabled = YES;
    }
    self.scoreLabel.text = @"Score: 0";
}

- (IBAction)chooseCard:(UIButton *)sender {
    [game chooseCardAtIndex:[_cards indexOfObject:sender]];    
    [self updateDisplay];
}

- (UIImage *)backgroundImageForCard:(Card *)card {
    return card.chosen ? [UIImage imageNamed:@"backGround.png"] : [UIImage imageNamed:@"morback.png"];
}


- (NSString *)titleForCard:(Card *)card {
    return card.chosen ? card.contents : @"";
}

- (void) updateDisplay {
    for (UIButton *b in _cards) {
        
        PlayingCard *theCard = [game pickOneCard:[_cards indexOfObject:b]];
        b.enabled = !theCard.matched;
        if (b.touchInside) {
            //Animate the one you clicked on
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:b cache:YES];
            [UIView setAnimationDelegate:self];
            [UIView setAnimationDuration:.5];
            
            [b setTitle:[self titleForCard:theCard] forState:UIControlStateNormal];
            [b setBackgroundImage:[self backgroundImageForCard:theCard] forState:UIControlStateNormal];
            
            [UIView commitAnimations];
        }
        else if (b.enabled){
            if (b.titleLabel.text) {
                //Animate the one that did not match and should flip back
                b.titleLabel.text = nil;
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:b cache:YES];
                [UIView setAnimationDelegate:self];
                [UIView setAnimationDuration:.5];
                
                [b setTitle:nil forState:UIControlStateNormal];
                [b setBackgroundImage:[UIImage imageNamed:@"morback.png"] forState:UIControlStateNormal];
                
                [UIView commitAnimations];
            } else {
                [b setTitle:[self titleForCard:theCard] forState:UIControlStateNormal];
                [b setBackgroundImage:[self backgroundImageForCard:theCard] forState:UIControlStateNormal];
            }
        }
        //b.enabled = !theCard.matched;
    }
    self.scoreLabel.text = [NSString stringWithFormat: @"Score: %ld", (long)game.score];
}
@end
