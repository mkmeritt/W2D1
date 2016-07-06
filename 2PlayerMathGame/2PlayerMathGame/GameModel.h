//
//  GameModel.h
//  2PlayerMathGame
//
//  Created by Mark Meritt on 2016-07-04.
//  Copyright © 2016 Apptist. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

typedef NS_ENUM(NSUInteger, GameTurn){
    Player1Turn,
    Player2Turn,
};

@interface GameModel : NSObject

@property (nonatomic, assign) int firstNum;
@property (nonatomic, assign) int secondNum;
@property (nonatomic, assign) int result;
@property (nonatomic, strong) NSMutableString* enteredNum;
@property (nonatomic, strong) NSArray* arithmetic;
@property (nonatomic, strong) NSString* sign;

-(void)randomize;
-(int)randomizeSign;

-(BOOL)guessRight;
-(void)increaseScore: (Player*)player;

@end
