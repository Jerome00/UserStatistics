//
//  UIViewController+UserStatistics.m
//  UserStatisticsWithRuntime
//
//  Created by JJ on 2017/4/20.
//  Copyright © 2017年 JJ. All rights reserved.
//

#import "UIViewController+UserStatistics.h"
#import "JJSwizzleUtility.h"

@implementation UIViewController (UserStatistics)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        // When swizzling a class method, use the following:
        // Class class = object_getClass((id)self);
        
        SEL originalSelector = @selector(viewWillAppear:);
        SEL swizzledSelector = @selector(swiz_viewWillAppear:);
        [JJSwizzleUtility swizzlingInClass:[self class] originalSelector:originalSelector swizzledSelector:swizzledSelector];
        
        SEL originalSelector2 = @selector(viewWillDisappear:);
        SEL swizzledSelector2 = @selector(swiz_viewWillDisappear:);
        [JJSwizzleUtility swizzlingInClass:[self class] originalSelector:originalSelector2 swizzledSelector:swizzledSelector2];
    });
}

- (void)swiz_viewWillAppear:(BOOL)animated
{
    //插入需要执行的代码
    NSLog(@"enter");
}

- (void)swiz_viewWillDisappear:(BOOL)animated
{
    NSLog(@"leave");
}


- (NSString *)pageEventID:(BOOL)bEnterPage
{
    NSDictionary *configDict = [self dictionaryFromUserStatisticsConfigPlist];
    NSString *selfClassName = NSStringFromClass([self class]);
    return configDict[selfClassName][@"PageEvent"][bEnterPage ? @"Enter" : @"Leave"];
}

- (NSDictionary *)dictionaryFromUserStatisticsConfigPlist
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"userStastics" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:filePath];
    return dic;
}



@end
