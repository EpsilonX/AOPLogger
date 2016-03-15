//
//  AppDelegate+Logging.m
//  AOPLogger
//
//  Created by EpsilonX on 16/3/15.
//  Copyright © 2016年 . All rights reserved.
//

#import "AppDelegate+Logging.h"
#import "AOPLogger.h"

@implementation AppDelegate (Logging)

- (void)setupLogging
{
    NSDictionary *config = @{
                             @"ViewController": @{
                                     AOPLoggerSelectors: @[
                                             @{
                                                 AOPLoggerSelectorName: @"btnClick:",
                                                 AOPLoggerPosition: AOPPositionAfter,
                                                 AOPLoggerHandlerBlock:^(id<AspectInfo> aspectInfo){
                                                     NSLog(@"AOP: button pressed in %@", aspectInfo.instance);
                                                 }
                                                 },
                                             @{
                                                 AOPLoggerSelectorName: @"repeat:",
                                                 AOPLoggerPosition: AOPPositionBefore,
                                                 AOPLoggerHandlerBlock:^(id<AspectInfo> aspectInfo, NSString *str){
                                                     NSLog(@"AOP: repeat str %@", str);
                                                 }
                                                 }
                                             ]
                                     }
                             };
    
    [AOPLogger logWithDict:config];
}

@end
