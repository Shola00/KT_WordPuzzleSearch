//
//  Player.h
//  wordSearchPuzzle
//
//  Created by Shola Emmanuel on 07/05/2018.
//  Copyright © 2018 Shola Emmanuel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject


//player's name
@property (nonatomic, strong) NSString *playerName;

//player's score



-(id)initWithPlayerName:(NSString *)playerName;

@end
