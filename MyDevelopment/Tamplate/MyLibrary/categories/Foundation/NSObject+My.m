//
//  NSObject+My.m
//  MyDevelopment
//
//  Created by Petey Mi on 12/24/15.
//  Copyright © 2015 Petey Mi. All rights reserved.
//

#import "NSObject+My.h"

@implementation NSObject (My)

+(NSString*)className
{
    return NSStringFromClass([self class]);
}

@end
