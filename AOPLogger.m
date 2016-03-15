//
//  AOPLogger.m
//  AOPLogger
//
//  Created by EpsilonX on 16/3/15.
//  Copyright © 2016年. All rights reserved.
//

#import "AOPLogger.h"
@interface AOPLogger()

@property (nonatomic, strong) NSMutableArray *aspects;

@end

@implementation AOPLogger

typedef void (^AspectHandlerBlock)(id<AspectInfo> aspectInfo, ...);

- (instancetype)init{
    self = [super init];
    if (self) {
        self.aspects = [NSMutableArray array];
    }
    return self;
}

+ (instancetype)sharedInstance
{
    static AOPLogger *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[AOPLogger alloc] init];
    });
    return sharedInstance;
}

+ (void)logWithDict:(NSDictionary *)dict
{
    [[AOPLogger sharedInstance] logWithDict:dict];
}

+ (void)removeAOPLoggers
{
    [[AOPLogger sharedInstance] removeAOPLoggers];
}

- (void)logWithDict:(NSDictionary *)dict
{
    //ensure thread safe
    @synchronized(self) {
        for (NSString *className in dict) {
            @autoreleasepool {
                Class clazz = NSClassFromString(className);
                NSDictionary *config = dict[className];
                
                if (config[AOPLoggerSelectors]) {
                    for (NSDictionary *event in config[AOPLoggerSelectors]) {
                        SEL selectar = NSSelectorFromString(event[AOPLoggerSelectorName]);
                        AspectHandlerBlock block = event[AOPLoggerHandlerBlock];
                        AspectOptions option = [(NSNumber *)event[AOPLoggerPosition] unsignedIntegerValue];
                        
                        NSError *error = nil;
                        
                        id<AspectToken> aspect =  [clazz aspect_hookSelector:selectar
                                                                 withOptions:option
                                                                  usingBlock:block
                                                                       error:&error];
                        [self.aspects addObject:aspect];
                        
                        if (error) {
                            AOPLog(@"AOPLogger error in logWithDict: %@",error);
                        }
                    }
                }
            }
        }
    }
}


- (void)removeAOPLoggers
{
    //deregister all aspect logs
    @synchronized(self) {
        if ([self.aspects count] > 0) {
            for (id<AspectToken> aspect in self.aspects) {
                [aspect remove];
            }
            [self.aspects removeAllObjects];
        }
    }
}

@end
