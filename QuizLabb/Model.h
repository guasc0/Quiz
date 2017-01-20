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

- (void)addToDictionary;
- (bool) checkAnswer:(NSString*)sender;
@end
