//
//  NSDate+Utils.h
//  Test
//
//  Created by kys－1 on 16/1/7.
//  Copyright © 2016年 E-Flying Team. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (Utils)

- (NSString *)hybridTime;
//23:59
- (NSString *)shortTime;
//yyyy-MM-dd
- (NSString *)shortDate;
//yyyy-MM-dd HH:mm:ss
- (NSString *)stringWithFormatter:(NSString *)formatter;

+ (NSDate *)toLongDate:(NSString *)text;
//yyyy-MM-dd
+ (NSDate *)toShortDate:(NSString *)text;
+ (NSDate *)dateFromString:(NSString *)text formatter:(NSString *)formatter;
+ (NSString *)offsetTimeWithSeconds:(NSInteger)seconds;

@end
