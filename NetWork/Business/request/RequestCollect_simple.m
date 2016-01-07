//
//  RequestCollect.m
//  SmartLocation
//
//  Created by kys－1 on 15-5-21.
//  Copyright (c) 2015年 E-Flying Team. All rights reserved.
//

#import "RequestCollect.h"
#import "ResponseCollect.h"
#import "Path.h"

@implementation RequestCollect
- (Class)responseClass
{
    return [ResponseCollect class];
}

- (NSString *)path
{
    return Collect;
}
@end
