//
//  Player.m
//  2PlayerMathGame
//
//  Created by Mark Meritt on 2016-07-04.
//  Copyright © 2016 Apptist. All rights reserved.
//

#import "Player.h"

@implementation Player

-(instancetype)init{
    
    if(self = [super init]){
        
    _score = 0;
    _lives = 3;
        
    }
    
    return self;
}

-(void)loseLife{
    
    _lives -= 1;
    
}

@end
