//
//  SXLBundle.h
//  Test
//
//  Created by kys－1 on 16/1/7.
//  Copyright © 2016年 E-Flying Team. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SXLBundle : NSObject

+ (SXLBundle *)createBundle;

- (void)putObject:(id)anObject forKey:(NSString *)aKey;
- (void)putInteger:(NSInteger)anInt forKey:(NSString *)aKey;
- (void)putUInteger:(NSUInteger)anUnsignInt forKey:(NSString *)aKey;
- (void)putBool:(BOOL)aBool forKey:(NSString *)aKey;
- (void)putDouble:(double)aDouble forKey:(NSString *)aKey;

- (id)objectForKey:(NSString *)aKey;

- (NSInteger)intForKey:(NSString *)aKey;
- (NSInteger)intForKey:(NSString *)aKey defaultValue:(NSInteger)defaultValue;

- (NSUInteger)uintForKey:(NSString *)aKey;
- (NSUInteger)uintForKey:(NSString *)aKey defaultValue:(NSUInteger)defaultValue;

- (BOOL)boolForKey:(NSString *)aKey;
- (BOOL)boolForKey:(NSString *)aKey defaultValue:(BOOL)defaultValue;

- (double)doubleForKey:(NSString *)aKey;
- (double)doubleForKey:(NSString *)aKey defaultValue:(double)defaultValue;
@end
