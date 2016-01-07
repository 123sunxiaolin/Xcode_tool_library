//
//  RequestCollect.h
//  SmartLocation
//
//  Created by kys－1 on 15-5-21.
//  Copyright (c) 2015年 E-Flying Team. All rights reserved.
//

#import "RequestBean.h"

@interface RequestCollect : RequestBean
@property (nonatomic) int user_id;
@property (nonatomic, strong) NSString *locationName;//地点名
@property (nonatomic, strong) NSString *floorNumber;//所在楼层
@property (nonatomic, strong) NSString *pointNumber;//地点标号
@property (nonatomic, strong) NSString *clickPointX;//X坐标
@property (nonatomic, strong) NSString *clickPointY;//Y坐标
@end
