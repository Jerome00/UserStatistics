//
//  JJSwizzleUtility.h
//  UserStatisticsWithRuntime
//
//  Created by JJ on 2017/4/20.
//  Copyright © 2017年 JJ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JJSwizzleUtility : NSObject
+ (void)swizzlingInClass:(Class)cls originalSelector:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector;


@end
