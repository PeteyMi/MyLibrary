//
//  NSString+My.m
//  MyDevelopment
//
//  Created by Petey Mi on 12/25/15.
//  Copyright © 2015 Petey Mi. All rights reserved.
//

#import "NSString+My.h"

#pragma mark - Date
@implementation NSString (Date)

-(NSDate*)dateFormatter:(NSString*)formatter
{
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:formatter];
    return [dateFormatter dateFromString:self];
}

@end