//
//  SXLBundle.m
//  Test
//
//  Created by kys－1 on 16/1/7.
//  Copyright © 2016年 E-Flying Team. All rights reserved.
//

#import "SXLBundle.h"
#import "SXLMarco.h"

@interface SXLBundle()
{
    NSMutableDictionary *_dict;
}
@end

@implementation SXLBundle

+ (SXLBundle *)createBundle
{
    return [[SXLBundle alloc] init];
}

- (id)init
{
    self = [super init];
    if (self) {
        _dict = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (void)putObject:(id)anObject forKey:(NSString *)aKey
{
    if (anObject == nil) {
        [_dict setObject:[NSNull null] forKey:aKey];
    } else {
        [_dict setObject:anObject forKey:aKey];
    }
}

- (void)putInteger:(NSInteger)anInt forKey:(NSString *)aKey
{
    NSNumber *number = [[NSNumber alloc] initWithInteger:anInt];
    [self putObject:number forKey:aKey];
}

- (void)putUInteger:(NSUInteger)anUnsignInt forKey:(NSString *)aKey
{
    NSNumber *number = [[NSNumber alloc] initWithInteger:anUnsignInt];
    [self putObject:number forKey:aKey];
}

- (void)putBool:(BOOL)aBool forKey:(NSString *)aKey
{
    NSNumber *number = [[NSNumber alloc] initWithBool:aBool];
    [self putObject:number forKey:aKey];
}

- (void)putDouble:(double)aDouble forKey:(NSString *)aKey
{
    NSNumber *number = [[NSNumber alloc] initWithDouble:aDouble];
    [self putObject:number forKey:aKey];
}

- (id)objectForKey:(NSString *)aKey
{
    return [_dict objectForKey:aKey];
}

- (NSInteger)intForKey:(NSString *)aKey
{
    return [self intForKey:aKey defaultValue:0];
}

- (NSInteger)intForKey:(NSString *)aKey defaultValue:(NSInteger)defaultValue
{
    NSObject *object = [_dict objectForKey:aKey];
    if (T4_CHECK_CLASS(object, NSNumber)) {
        return [((NSNumber *)object) integerValue];
    } else {
        return defaultValue;
    }
}

- (NSUInteger)uintForKey:(NSString *)aKey
{
    return [self uintForKey:aKey defaultValue:0];
}

- (NSUInteger)uintForKey:(NSString *)aKey defaultValue:(NSUInteger)defaultValue
{
    NSObject *object = [_dict objectForKey:aKey];
    if (T4_CHECK_CLASS(object, NSNumber)) {
        return [((NSNumber *)object) unsignedIntegerValue];
    } else {
        return defaultValue;
    }
}

- (BOOL)boolForKey:(NSString *)aKey
{
    return [self boolForKey:aKey defaultValue:NO];
}

- (BOOL)boolForKey:(NSString *)aKey defaultValue:(BOOL)defaultValue
{
    NSObject *object = [_dict objectForKey:aKey];
    if (T4_CHECK_CLASS(object, NSNumber)) {
        return [((NSNumber *)object) boolValue];
    } else {
        return defaultValue;
    }
}

- (double)doubleForKey:(NSString *)aKey
{
    return [self doubleForKey:aKey defaultValue:0];
}

- (double)doubleForKey:(NSString *)aKey defaultValue:(double)defaultValue
{
    NSObject *object = [_dict objectForKey:aKey];
    if (T4_CHECK_CLASS(object, NSNumber)) {
        return [((NSNumber *)object) doubleValue];
    } else {
        return defaultValue;
    }
}

@end
