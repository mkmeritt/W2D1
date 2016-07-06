//
//  Player.h
//  2PlayerMathGame
//
//  Created by Mark Meritt on 2016-07-04.
//  Copyright © 2016 Apptist. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (nonatomic, assign) int score;
@property (nonatomic, assign) int lives;

-(void)loseLife;

@end
