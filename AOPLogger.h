//
//  AOPLogger.h
//  AOPLogger
//
//  Created by EpsilonX on 16/3/15.
//  Copyright © 2016年. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Aspects.h"

//tags
#define AOPLoggerSelectors      @"selectors"
#define AOPLoggerSelectorName   @"selectorName"
#define AOPLoggerHandlerBlock   @"block"
#define AOPLoggerPosition       @"position"

//AOPLog type
#define AOPLog  NSLog

//postions
#define AOPPositionAfter [NSNumber numberWithUnsignedInteger:AspectPositionAfter]
#define AOPPositionBefore [NSNumber numberWithUnsignedInteger:AspectPositionBefore]

@interface AOPLogger : NSObject

+ (instancetype)sharedInstance;
+ (void)logWithDict:(NSDictionary *)dict;
+ (void)removeAOPLoggers;
- (void)logWithDict:(NSDictionary *)dict;
- (void)removeAOPLoggers;

@end
