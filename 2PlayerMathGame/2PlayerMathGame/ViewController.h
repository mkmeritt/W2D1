//
//  ViewController.h
//  2PlayerMathGame
//
//  Created by Mark Meritt on 2016-07-04.
//  Copyright © 2016 Apptist. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameModel.h"
#import "Player.h"
@interface ViewController : UIViewController

@property (nonatomic, assign) int xVal;
@property (nonatomic, assign) int yVal;
- (IBAction)zeroPressed:(id)sender;

- (IBAction)onePressed:(id)sender;
- (IBAction)twoPressed:(id)sender;
- (IBAction)threePressed:(id)sender;
- (IBAction)fourPressed:(id)sender;
- (IBAction)fivePressed:(id)sender;
- (IBAction)sixPressed:(id)sender;
- (IBAction)sevenPressed:(id)sender;
- (IBAction)eightPressed:(id)sender;
- (IBAction)ninePressed:(id)sender;
- (IBAction)enterBtnPressed:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *enteredLbl;
@property (strong, nonatomic) IBOutlet UIImageView *resultView;
@property (weak, nonatomic) IBOutlet UILabel *playerTurnLbl;
@property (weak, nonatomic) IBOutlet UILabel *p1ScoreLbl;
@property (weak, nonatomic) IBOutlet UILabel *p2ScoreLbl;
@property (strong, nonatomic) UIImage* noImg;
@property (strong, nonatomic) UIImage* yesImg;
@property (weak, nonatomic) IBOutlet UIView *p1LivesView;
@property (weak, nonatomic) IBOutlet UIView *p2LivesView;
@property (weak, nonatomic) IBOutlet UIImageView *p1heart1;
@property (weak, nonatomic) IBOutlet UIImageView *p1heart2;
@property (weak, nonatomic) IBOutlet UIImageView *p1heart3;

@property (weak, nonatomic) IBOutlet UIImageView *p2heart1;
@property (weak, nonatomic) IBOutlet UIImageView *p2heart2;
@property (weak, nonatomic) IBOutlet UIImageView *p2heart3;


-(void)generate;
-(void)enterLabelClear;
-(void)restart;

@end

