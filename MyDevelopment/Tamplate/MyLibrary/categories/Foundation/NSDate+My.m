//
//  NSDate+My.m
//  MyDevelopment
//
//  Created by Petey Mi on 12/25/15.
//  Copyright © 2015 Petey Mi. All rights reserved.
//

#import "NSDate+My.h"

#pragma mark - String
@implementation NSDate (String)

-(NSString*)stringFormatter:(NSString*)formatter
{
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatter];
    return [dateFormatter stringFromDate:self];
}

@end
