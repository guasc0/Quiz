//
//  Model.h
//  QuizLabb
//
//  Created by Gualberto Scolari on 2017-01-17.
//  Copyright © 2017 Gualberto Scolari. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject
@property (nonatomic) NSMutableArray * questionArray;
@property (nonatomic) NSDictionary *currentQuestion;
@property (nonatomic) int rigthGuesses;
@property (nonatomic) int wrongGuesses;
@property (nonatomic) int nrOfRounds;

- (void)addToDictionary;
- (bool) checkAnswer:(NSString*)sender;
@end
