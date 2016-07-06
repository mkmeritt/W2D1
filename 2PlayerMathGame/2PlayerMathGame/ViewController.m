//
//  ViewController.m
//  2PlayerMathGame
//
//  Created by Mark Meritt on 2016-07-04.
//  Copyright © 2016 Apptist. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

Player* player1;
Player* player2;
GameModel* model;
GameTurn turn;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    player1 = [Player new];
    player2 = [Player new];
    
    player1.score = 0;
    player2.score = 0;
    
    model.firstNum = 0;
    model.secondNum = 1;
    
    self.p1ScoreLbl.text = [NSString stringWithFormat:@"P1 Score: %d", player1.score];
    self.p2ScoreLbl.text = [NSString stringWithFormat:@"P2 Score: %d", player2.score];

    
    model = [GameModel new];
    
    turn = Player1Turn;
    
    
    model.enteredNum = [NSMutableString new];
    
    
    self.noImg = [UIImage imageNamed:@"no.png"];
    self.yesImg = [UIImage imageNamed:@"yes.png"];
    
    
    [self generate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)generate{
    
         [model randomize];
    
       
    
    self.xVal = model.firstNum;
    self.yVal = model.secondNum;
    
    if(turn == Player1Turn){
        self.playerTurnLbl.text = [NSString stringWithFormat:@"Player 1: %d %@ %d?", self.xVal, model.sign, self.yVal];
    }
    
    if(turn == Player2Turn){
        self.playerTurnLbl.text = [NSString stringWithFormat:@"Player 2: %d %@ %d?", self.xVal, model.sign, self.yVal];
    }
    
    switch (player1.lives) {
        case 3:
            self.p1heart1.hidden = NO;
            self.p1heart2.hidden = NO;
            self.p1heart3.hidden = NO;
            break;
        case 2:
            self.p1heart1.hidden = NO;
            self.p1heart2.hidden = NO;
            self.p1heart3.hidden = YES;
            break;
        case 1:
            self.p1heart1.hidden = NO;
            self.p1heart2.hidden = YES;
            self.p1heart3.hidden = YES;
            break;
        case 0:
            self.p1heart1.hidden = YES;
            self.p1heart2.hidden = YES;
            self.p1heart3.hidden = YES;
            [self restart];
            break;
    }
    
    switch (player2.lives) {
        case 3:
            self.p2heart1.hidden = NO;
            self.p2heart2.hidden = NO;
            self.p2heart3.hidden = NO;
            break;
        case 2:
            self.p2heart1.hidden = NO;
            self.p2heart2.hidden = NO;
            self.p2heart3.hidden = YES;
            break;
        case 1:
            self.p2heart1.hidden = NO;
            self.p2heart2.hidden = YES;
            self.p2heart3.hidden = YES;
            break;
        case 0:
            self.p2heart1.hidden = YES;
            self.p2heart2.hidden = YES;
            self.p2heart3.hidden = YES;
            [self restart];
            break;
    }
}

- (IBAction)zeroPressed:(id)sender {
    [model.enteredNum appendString:@"0"];
        self.enteredLbl.text = model.enteredNum;
}

- (IBAction)onePressed:(id)sender {
    
    [model.enteredNum appendString:@"1"];
        self.enteredLbl.text = model.enteredNum;
}

- (IBAction)twoPressed:(id)sender {
     [model.enteredNum appendString:@"2"];
        self.enteredLbl.text = model.enteredNum;
}

- (IBAction)threePressed:(id)sender {
     [model.enteredNum appendString:@"3"];
        self.enteredLbl.text = model.enteredNum;
}

- (IBAction)fourPressed:(id)sender {
     [model.enteredNum appendString:@"4"];
        self.enteredLbl.text = model.enteredNum;
}

- (IBAction)fivePressed:(id)sender {
     [model.enteredNum appendString:@"5"];
        self.enteredLbl.text = model.enteredNum;
}

- (IBAction)sixPressed:(id)sender {
     [model.enteredNum appendString:@"6"];
        self.enteredLbl.text = model.enteredNum;
}

- (IBAction)sevenPressed:(id)sender {
     [model.enteredNum appendString:@"7"];
        self.enteredLbl.text = model.enteredNum;
}

- (IBAction)eightPressed:(id)sender {
     [model.enteredNum appendString:@"8"];
        self.enteredLbl.text = model.enteredNum;
}

- (IBAction)ninePressed:(id)sender {
     [model.enteredNum appendString:@"9"];
    self.enteredLbl.text = model.enteredNum;
}

- (IBAction)enterBtnPressed:(id)sender {
    self.enteredLbl.text = model.enteredNum;
    NSLog(@"Entered Number: %@", model.enteredNum);
    NSLog(@"Result: %d", model.result);
    
    
    if(model.result == [model.enteredNum intValue]) {
        self.resultView.image = self.yesImg;
    }
    else if(model.result != [model.enteredNum intValue]) {
        self.resultView.image = self.noImg;
    }
    
        if(turn == Player1Turn){
            if(model.guessRight){
                [model increaseScore:player1];
            } else {
                [player1 loseLife];
            }
            turn = Player2Turn;
            [self generate];
        }
        else if(turn == Player2Turn){
            if(model.guessRight){
                [model increaseScore:player2];
            } else {
                [player2 loseLife];
            }
            turn = Player1Turn;
            [self generate];
        }
    
     model.enteredNum = [NSMutableString new];
    
    NSLog(@"Turn: %lu", (unsigned long)turn);
    
    self.p1ScoreLbl.text = [NSString stringWithFormat:@"P1 Score: %d", player1.score];
    self.p2ScoreLbl.text = [NSString stringWithFormat:@"P2 Score: %d", player2.score];
    [self enterLabelClear];
}

-(void)enterLabelClear{
    self.enteredLbl.text = @"0";
}

-(void)restart{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"You Lose" message:@"Would you like to play again?" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    
    [self presentViewController:alert animated:YES completion:^{[self viewDidLoad];}];
}
@end
