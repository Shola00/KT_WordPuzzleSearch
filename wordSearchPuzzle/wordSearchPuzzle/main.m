//
//  main.m
//  wordSearchPuzzle
//
//  Created by Shola Emmanuel on 03/05/2018.
//  Copyright © 2018 Shola Emmanuel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
#import "WordPuzzle.h"

int main(int argc, const char * argv[]) {
    
    NSMutableArray *puzzleCorrectWords = [NSMutableArray arrayWithObjects:@"johnny",@"sophie",@"oleg",@"prison", nil];
    
    
    NSMutableArray *puzzleContents = [NSMutableArray arrayWithObjects:@"s j v w v u",@"n o s i r p",@"g h p y c r",@"e n e h f a",@"l n w v i x",@"o y j s w e", nil];
    
    WordPuzzle *puzzle1 = [[WordPuzzle alloc] initWithPuzzleContents:puzzleContents correctWords:puzzleCorrectWords];
    puzzle1.maxAttempts=5;
    
    [puzzle1 launchGame];
    
    return 0;
}
