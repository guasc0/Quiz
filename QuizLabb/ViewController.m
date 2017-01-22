//
//  ViewController.m
//  QuizLabb
//
//  Created by Gualberto Scolari on 2017-01-17.
//  Copyright © 2017 Gualberto Scolari. All rights reserved.
//

#import "ViewController.h"
#import "Model.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *questionView;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;
@property (weak, nonatomic) IBOutlet UIButton *nextQuestion;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *infoText;
@property (weak, nonatomic) IBOutlet UITextView *questionText;
@property (weak, nonatomic) IBOutlet UITextView *resultScreen;
@property (nonatomic) Model *m1;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self newGame];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)resetViewsAndButtons{
    self.button.backgroundColor = [UIColor blackColor];
    self.button2.backgroundColor = [UIColor blackColor];
    self.button3.backgroundColor = [UIColor blackColor];
    self.button4.backgroundColor = [UIColor blackColor];
    self.infoText.text = @"";
}

- (void)setQuestion{
    
    [self resetViewsAndButtons];
    int index = arc4random() % self.m1.questionArray.count;
    self.m1.currentQuestion = self.m1.questionArray[index];
    self.questionText.text = self.m1.currentQuestion[@"question"];
    [self.m1.questionArray removeObjectAtIndex:index];
    [self setButtons];
    
}

- (void)setButtons{
    
    NSMutableArray *randomButtons = [NSMutableArray arrayWithObjects: self.m1.currentQuestion[@"correctAnswer"], self.m1.currentQuestion[@"wrongAnswer1"], self.m1.currentQuestion[@"wrongAnswer2"], self.m1.currentQuestion[@"wrongAnswer3"], nil];
    
    for(int i = 0; i < randomButtons.count; i++){
        [randomButtons exchangeObjectAtIndex:i withObjectAtIndex:arc4random() % randomButtons.count];
    
    }
    
    [self.button setTitle:(randomButtons[0]) forState:UIControlStateNormal];
    [self.button2 setTitle:(randomButtons[1]) forState:UIControlStateNormal];
    [self.button3 setTitle:(randomButtons[2]) forState:UIControlStateNormal];
    [self.button4 setTitle:(randomButtons[3]) forState:UIControlStateNormal];
    self.nextQuestion.hidden = YES;
    

}

- (void)fixButtons{
    [[self.button layer] setBorderWidth:1.0f];
    [[self.button layer] setCornerRadius:7.0f];
    [[self.button layer] setBorderColor:[UIColor whiteColor].CGColor];
    
    [[self.button2 layer] setBorderWidth:1.0f];
    [[self.button2 layer] setCornerRadius:7.0f];
    [[self.button2 layer] setBorderColor:[UIColor whiteColor].CGColor];
    
    [[self.button3 layer] setBorderWidth:1.0f];
    [[self.button3 layer] setCornerRadius:7.0f];
    [[self.button3 layer] setBorderColor:[UIColor whiteColor].CGColor];
    
    [[self.button4 layer] setBorderWidth:1.0f];
    [[self.button4 layer] setCornerRadius:4.0f];
    [[self.button4 layer] setBorderColor:[UIColor whiteColor].CGColor];
    
    [[self.nextQuestion layer] setBorderWidth:1.0f];
    [[self.nextQuestion layer] setCornerRadius:7.0f];
    [[self.nextQuestion layer] setBorderColor:[UIColor whiteColor].CGColor];
    
    [[self.questionText layer] setBorderWidth:1.0f];
    [[self.questionText layer] setCornerRadius:7.0f];
    [[self.questionText layer] setBorderColor:[UIColor whiteColor].CGColor];
}

- (IBAction)buttonPressed:(id)sender {
    UIButton *pressed = (UIButton *) sender;
    [self enableButtons:NO];
    if([self.m1 checkAnswer:pressed.titleLabel.text]){
        pressed.backgroundColor = [UIColor greenColor];
        
    } else {
        pressed.backgroundColor = [UIColor redColor];
    }
    
    if(self.m1.nrOfRounds == 5){
        [self.resultScreen setHidden:NO];
        self.resultScreen.text = [NSString stringWithFormat:@"Antal rätt: %d\r Antal fel: %d", self.m1.rigthGuesses, self.m1.wrongGuesses];
        [self.nextQuestion setTitle:@"Spela igen" forState:UIControlStateNormal];
        
        
    }
    self.nextQuestion.hidden = NO;
    NSLog(@"%d", self.m1.rigthGuesses);
}

- (IBAction)nextQuestion:(id)sender {
    [self enableButtons:YES];
    [self setQuestion];
    
    if([self.nextQuestion.titleLabel.text isEqual:@"Spela igen"]){
        [self newGame];
        self.resultScreen.hidden = YES;
    }
}

- (void)enableButtons: (BOOL)enabled{
    self.button.enabled = enabled;
    self.button2.enabled = enabled;
    self.button3.enabled = enabled;
    self.button4.enabled = enabled;
}
- (void)newGame{
    self.resultScreen.hidden = YES;
    [self fixButtons];
    self.m1 = [[Model alloc] init];
    [self.m1 addToDictionary];
    [self setQuestion];
    [self.resultScreen setHidden:YES];
    self.nextQuestion.hidden = YES;
    [self.nextQuestion setTitle:@"Nästa fråga" forState:UIControlStateNormal];
}


@end
