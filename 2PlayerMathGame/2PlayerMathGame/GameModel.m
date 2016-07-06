//
//  GameModel.m
//  2PlayerMathGame
//
//  Created by Mark Meritt on 2016-07-04.
//  Copyright © 2016 Apptist. All rights reserved.
//

#import "GameModel.h"

@implementation GameModel

-(instancetype)init{
    if(self = [super init]){
        
        self.sign = @"";
        self.arithmetic = @[@"+", @"-", @"*"];
        
        [self randomize];
      
    }
    
    return self;
}

-(void)randomize{
    int value1 = arc4random() % 9 + 1;
    int value2 = arc4random() % 9 + 1;
    
    self.firstNum = value1;
    self.secondNum = value2;
    
    [self randomizeSign];
    
    if([self randomizeSign] == 0){
        self.result = self.firstNum + self.secondNum;
    }
    
    if([self randomizeSign] == 1){
        self.result = self.firstNum - self.secondNum;
    }
    
    if([self randomizeSign] == 2){
        self.result = self.firstNum * self.secondNum;
    }
}

-(int)randomizeSign{
     self.sign = [self.arithmetic objectAtIndex:arc4random()%[self.arithmetic count]];
    
    if(self.sign == self.arithmetic[0]){
        return 0;
    }
    
    if(self.sign == self.arithmetic[1]){
        return 1;
    }
    
    if(self.sign == self.arithmetic[2]) {
        return 2;
    }
    
  
    return 3;
}

-(BOOL)guessRight{
    if(_result == [self.enteredNum intValue]) {
        return YES;
    }
    
    return NO;
}

-(void)increaseScore:(Player *)player{
    player.score += 5;
}

@end
