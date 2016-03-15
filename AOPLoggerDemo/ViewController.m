//
//  ViewController.m
//  AOPLogger
//
//  Created by EpsilonX on 16/3/15.
//  Copyright © 2016年 . All rights reserved.
//

#import "ViewController.h"
#import "AOPLogger.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIButton *removeButton;

- (IBAction)btnClick:(id)sender;
- (IBAction)removeBtnClick:(id)sender;
- (BOOL)repeat:(NSString *)str;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnClick:(id)sender {
    NSLog(@"in btn click!");
    [self repeat:@"repeatString!"];
}

- (IBAction)removeBtnClick:(id)sender {
    NSLog(@"all aspects removed!");
    [AOPLogger removeAOPLoggers];
}

- (BOOL)repeat:(NSString *)str
{
    NSLog(@"in repeat: %@",str);
    return YES;
}
@end
