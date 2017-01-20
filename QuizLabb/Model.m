//
//  Model.m
//  QuizLabb
//
//  Created by Gualberto Scolari on 2017-01-17.
//  Copyright © 2017 Gualberto Scolari. All rights reserved.
//

#import "Model.h"

@interface Model()

@property (nonatomic) NSDictionary *question1;
@property (nonatomic) NSDictionary *question2;
@property (nonatomic) NSDictionary *question3;
@property (nonatomic) NSDictionary *question4;
@property (nonatomic) NSDictionary *question5;
@property (nonatomic) NSDictionary *question6;
@property (nonatomic) NSDictionary *question7;
@property (nonatomic) NSDictionary *question8;
@property (nonatomic) NSDictionary *question9;
@property (nonatomic) NSDictionary *question10;

//@property (nonatomic) NSDictionary *currentQuestion;
@end

@implementation Model


- (void)addToDictionary{
    
    self.question1 = @{@"question": @"Vilken färg har solen?",
                       @"correctAnswer": @"gul",
                       @"wrongAnswer1": @"blå",
                       @"wrongAnswer2": @"röd",
                       @"wrongAnswer3": @"grön"};
    
    self.question2 = @{@"question": @"Hur lång är du?",
                       @"correctAnswer": @"178cm",
                       @"wrongAnswer1": @"182cm",
                       @"wrongAnswer2": @"167cm",
                       @"wrongAnswer3": @"198cm"};
    
    self.question3 = @{@"question": @"Vilken var Zlatans första proffsklubb?",
                       @"correctAnswer": @"Ajax",
                       @"wrongAnswer1": @"Juventus",
                       @"wrongAnswer2": @"Milan",
                       @"wrongAnswer3": @"Barcelona"};
    
    self.question4 = @{@"question": @"Vad är en björn?",
                       @"correctAnswer": @"Ett djur",
                       @"wrongAnswer1": @"En människa",
                       @"wrongAnswer2": @"En bil",
                       @"wrongAnswer3": @"En cykel"};
    
    self.question5 = @{@"question": @"Hur lång är en halvlek i handboll?",
                       @"correctAnswer": @"30 min",
                       @"wrongAnswer1": @"25 min",
                       @"wrongAnswer2": @"35 min",
                       @"wrongAnswer3": @"40 min"};
    
    self.question6 = @{@"question": @"Vilket år är det  i år?",
                       @"correctAnswer": @"2017",
                       @"wrongAnswer1": @"1927",
                       @"wrongAnswer2": @"2012",
                       @"wrongAnswer3": @"1976"};
    
    self.question7 = @{@"question": @"Vilket av följande partier anses inte vara en borgerligt sådant ?",
                       @"correctAnswer": @"Socialdemokraterna",
                       @"wrongAnswer1": @"Centerpartiet",
                       @"wrongAnswer2": @"Moderaterna",
                       @"wrongAnswer3": @"Kd"};
    
    self.question8 = @{@"question": @"Vad är en björn?",
                       @"correctAnswer": @"Ett djur",
                       @"wrongAnswer1": @"En människa",
                       @"wrongAnswer2": @"En bil",
                       @"wrongAnswer3": @"En cykel"};
    
    self.question9 = @{@"question": @"Vad är en björn?",
                       @"correctAnswer": @"Ett djur",
                       @"wrongAnswer1": @"En människa",
                       @"wrongAnswer2": @"En bil",
                       @"wrongAnswer3": @"En cykel"};
    
    self.question10 = @{@"question": @"Vad är en björn?",
                       @"correctAnswer": @"Ett djur",
                       @"wrongAnswer1": @"En människa",
                       @"wrongAnswer2": @"En bil",
                       @"wrongAnswer3": @"En cykel"};
    
    self.questionArray = [NSMutableArray arrayWithObjects:self.question1, self.question2, self.question3, self.question4, self.question5, self.question6, self.question7, self.question8, self.question9, self.question10, nil];
}



- (bool) checkAnswer:(NSString*) answer{
    NSLog(@" answer is:%@", answer);
    NSLog(@" rigth answer:%@", self.currentQuestion[@"correctAnswer"]);
    self.nrOfRounds++;
    if(self.nrOfRounds == 5){
    
    }
    if([self.currentQuestion[@"correctAnswer"]isEqualToString: answer]){
        self.rigthGuesses++;
        return YES;
    }else{
        self.wrongGuesses++;
        return NO;
    }
}
@end
