#AOPLogger

##简介

基于iOS开源工具Aspects实现的面向切面日志组件

##方法介绍

1. `(void)logWithDict:(NSDictionary *)dict;`
通过NSDictionary对象向项目中注入Log信息

2. `(void)removeAOPLoggers;`
移除所有通过AOPLogger注入的log信息

##快速上手

```Objective-C

#import "AOPLogger.h"
........
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

```

##DEMO

详见AOPLoggerDemo

##FAQ

Q1: 如何引入AOPLogger？

A1: 只需将AOPLogger.h、AOPLogger.m、Aspects.h、Aspects.m这4个文件引入您的项目中即可。

Q2: 为何要使用AOPLogger？

A2：面向切面编程(AOP)是一种非常好的编程理念，将日志逻辑与业务逻辑解耦，是AOP的经典应用。通过AOPLogger，您可以把日志代码以字典形式动态添加到实际需要添加日志信息的类中。AOPLogger利用了Objective-C的Method-Swizzling，动态添加了日志信息。

Q3: AOPLogger和其他Log组件有什么不同？

A3: AOPLogger仅提供了一种日志注入的方式，可以结合其他Log组件（例如DDLog）使用，效果更佳。

##其他说明

本项目基于开源工具[Aspects(https://github.com/steipete/Aspects)](https://github.com/steipete/Aspects)，参考了[okcomp/AspectsDemo](https://github.com/okcomp/AspectsDemo)


