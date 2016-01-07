//
//  NSDate+Utils.m
//  Test
//
//  Created by kys－1 on 16/1/7.
//  Copyright © 2016年 E-Flying Team. All rights reserved.
//

#import "NSDate+Utils.h"

static NSDateFormatter *dateFormatter = nil;

@implementation NSDate (Utils)

+ (NSDateFormatter *)dateFormatterWithFormat:(NSString *)format
{
    if (dateFormatter == nil) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.timeZone = [NSTimeZone systemTimeZone];
    }
    dateFormatter.dateFormat = format;
    return dateFormatter;
}

+ (NSString *)offsetTimeWithSeconds:(NSInteger)seconds
{
    //毫秒数转成天时分秒
    seconds = seconds * 1000;
    NSInteger ss = 1000;
    NSInteger mi = ss * 60;
    NSInteger hh = mi * 60;
    NSInteger dd = hh * 24;
    
    NSInteger day = seconds / dd;
    seconds = seconds % dd;
    NSInteger hour = seconds / hh;
    seconds = seconds % hh;
    NSInteger minute = seconds / mi;
    seconds = seconds % mi;
    if (seconds > 0)
        minute += 1;
    
    NSMutableString *sb = [[NSMutableString alloc] init];
    if(day > 0) {
        [sb appendFormat:@"%ld天", day];
    } else {
        if (hour > 0) {
            [sb appendFormat:@"%ld时", hour];
        }
        if (minute > 0) {
            [sb appendFormat:@"%ld分", minute - 1];
        }
    }
    return sb;
}

- (NSString *)hybridTime
{
    NSTimeInterval time = [self timeIntervalSinceNow];
    NSInteger oneDay = 24 * 60 * 60;
    if (time + oneDay > 0) {
        return [self shortTime];
    } else if (time + 2 * oneDay > 0) {
        return @"昨天";
    } else {
        return [self stringWithFormatter:@"MM-dd"];
    }
}

- (NSString *)shortTime //23:59
{
    return [self stringWithFormatter:@"HH:mm"];
}

- (NSString *)shortDate
{
    return [self stringWithFormatter:@"yyyy-MM-dd"];
}

- (NSString *)stringWithFormatter:(NSString *)formatter
{
    NSDateFormatter *dateFormatter = [NSDate dateFormatterWithFormat:formatter];
    return [dateFormatter stringFromDate:self];
}

+ (NSDate *)dateFromString:(NSString *)text formatter:(NSString *)formatter
{
    NSDateFormatter *dateFormatter = [NSDate dateFormatterWithFormat:formatter];
    return [dateFormatter dateFromString:text];
}

//yyyy-MM-dd HH:mm:ss
+ (NSDate *)toLongDate:(NSString *)text
{
    return [NSDate dateFromString:text formatter:@"yyyy-MM-dd HH:mm:ss"];
}

//yyyy-MM-dd
+ (NSDate *)toShortDate:(NSString *)text
{
    return [NSDate dateFromString:text formatter:@"yyyy-MM-dd"];
}

@end
