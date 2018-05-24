//
//  WordPuzzle.m
//  wordSearchPuzzle
//
//  Created by Shola Emmanuel on 07/05/2018.
//  Copyright © 2018 Shola Emmanuel. All rights reserved.
//

#import "WordPuzzle.h"

@implementation WordPuzzle


-(id)initWithPuzzleContents:(NSMutableArray *)puzzleContents correctWords:(NSMutableArray *)correctWords {
    
    self = [super init];
    if(self) {
        self.puzzleContents = puzzleContents;
        self.correctWords = correctWords;
        self.correctlyGuessedWords = [[NSMutableArray alloc] init];
        self.playerScore = 0;
        self.playerAttempts= 0;
        self.numberOfWordsInArray = [self.correctWords count];
    }
    
    return self;
}


-(NSString *)promptForPlayerReply{

    char cString[100];
    //cString is a string of 100 characters (technically an array of 100 characters)
    
    NSLog(@"guess a word...");
    scanf("%s", &cString);
    
    NSString *playerInput = [NSString stringWithCString: cString encoding: NSASCIIStringEncoding];
    
    return playerInput;
}


-(void)printWordPuzzle{
    
    NSLog(@"%@",self.puzzleContents);
}

-(void)increasePlayerScore {
    
    self.playerScore ++;
}

-(void)increasePlayerAttempt {
    
    self.playerAttempts++;
}

-(BOOL)isPlayerInputACorrectWord:(NSString *) playerInput{
    
    return [self.correctWords containsObject:playerInput.lowercaseString];
}

-(BOOL)isPlayerInputACorrectlyGuesssedWord :(NSString *) playerInput{
    
    return [self.correctlyGuessedWords containsObject:playerInput.lowercaseString];
}

-(void)reduceNumberOfWordsInArray{
    
    self.numberOfWordsInArray --;
}

-(void)handleCorrectWords:(NSString *) playerInput {
    
    [self increasePlayerScore];
    [self reduceNumberOfWordsInArray];
    [self.correctWords removeObject:playerInput];
    [self.correctlyGuessedWords addObject:playerInput];
    NSLog(@"%@ is correct, your score is %d", playerInput,self.playerScore);
}

-(void)handlePreviouslyGuessedCorrectWords:(NSString *) playerInput {
    
    NSLog(@"you already guessed %@",playerInput);
    [self increasePlayerAttempt];
    NSLog(@"your attempt is %d" ,self.playerAttempts);
}

-(void)handleWrongWords:(NSString *) playerInput{
    
    [self increasePlayerAttempt];
    NSLog(@"%@ is wrong", playerInput);
    NSLog(@"your attempt is %d" ,self.playerAttempts);
}

-(void)handlePlayerGuess:(NSString *) playerInput {
    
    BOOL correctWord = [self isPlayerInputACorrectWord: playerInput];
    BOOL aCorrectWordPreviouslyGuessed =[self isPlayerInputACorrectlyGuesssedWord: playerInput];
    
    if (correctWord) {
        [self handleCorrectWords:playerInput];
    }
    else if (aCorrectWordPreviouslyGuessed) {
        [self handlePreviouslyGuessedCorrectWords:playerInput];
    }
    else{
        [self handleWrongWords:playerInput];
    }
}
    
    
-(void)launchGame {
    
    //run if the number of player's Attempt is less than the maximum attempt allowed
    //and
    //run if the number of words in correct words Array is not equal to 0
   
    //NSUInteger numberOfWordsInArray = [self.correctWords count];
    
    while ((self.playerAttempts < self.maxAttempts) && (self.numberOfWordsInArray != 0)){
        [self.correctWords count];
        [self printWordPuzzle];
        [self handlePlayerGuess:[self promptForPlayerReply]];
        
    }
    NSLog(@"game over, total score is %d",self.playerScore);
}



@end

