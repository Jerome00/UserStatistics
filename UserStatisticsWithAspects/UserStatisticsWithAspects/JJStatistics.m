//
//  JJStatistics.m
//  UserStatisticsWithAspects
//
//  Created by JJ on 2017/4/19.
//  Copyright © 2017年 JJ. All rights reserved.
//

#import "JJStatistics.h"
#import "Aspects.h"

@implementation JJStatistics

+ (void)userStatistics{
    NSDictionary * viewControllers = [self dicFromStatisticsPlist];
    for (NSString *className in viewControllers) {
        Class clazz = NSClassFromString(className);
        NSDictionary * config = viewControllers[className];
        if (config[@"ControlEvent"]){
            for (NSString *event in config[@"ControlEvent"]) {
                SEL selector = NSSelectorFromString(event);
                [clazz aspect_hookSelector:selector withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> aspectInfo) {
                    NSLog(@"%@",event);
                } error:NULL];
            }
        }
    }
}

+ (NSDictionary *)dicFromStatisticsPlist {
    NSString * filePath = [[NSBundle mainBundle] pathForResource:@"statistics" ofType:@"plist"];
    NSDictionary * dic = [NSDictionary dictionaryWithContentsOfFile:filePath];
    return dic;
}

@end
