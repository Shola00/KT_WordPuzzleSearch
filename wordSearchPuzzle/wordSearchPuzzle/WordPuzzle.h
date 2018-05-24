//
//  WordPuzzle.h
//  wordSearchPuzzle
//
//  Created by Shola Emmanuel on 07/05/2018.
//  Copyright © 2018 Shola Emmanuel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WordPuzzle : NSObject

@property (nonatomic, strong) NSMutableArray *puzzleContents;
@property (nonatomic, strong) NSMutableArray *correctWords;
@property (nonatomic, strong) NSMutableArray *correctlyGuessedWords;
@property (nonatomic) int playerScore;
@property (nonatomic) int playerAttempts;
@property (nonatomic) int maxAttempts;
@property (nonatomic) NSUInteger numberOfWordsInArray;


-(id)initWithPuzzleContents:(NSMutableArray *)puzzleContents correctWords:(NSMutableArray *)correctWords;
-(NSString *)promptForPlayerReply;
-(void)printWordPuzzle;
-(void)launchGame;
-(BOOL)isPlayerInputACorrectWord:(NSString *) playerInput;
-(BOOL)isPlayerInputACorrectlyGuesssedWord :(NSString *) playerInput;
-(void)increasePlayerScore;
-(void)increasePlayerAttempt;
-(void)handleCorrectWords:(NSString *) playerInput;
-(void)handlePreviouslyGuessedCorrectWords:(NSString *) playerInput;
-(void)handleWrongWords:(NSString *) playerInput;
-(void)handlePlayerGuess:(NSString *) playerInput;
-(void)reduceNumberOfWordsInArray;


//-(void)checkAgainstCorrectWords;
//letters of the puzzle.
//correct words of the puzzle.
//player
    

@end
