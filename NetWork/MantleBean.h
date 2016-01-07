//
//  MantleBean.h
//  EarthIOS
//
//  Created by Xiaohui on 15/3/20.
//  Copyright (c) 2015年 Duno Tech. All rights reserved.
//

#import <Mantle/Mantle.h>

#define MTL_OBJECT_TRANSFORMER(_propertyName, _class) \
\
+ (NSValueTransformer *)_propertyName##JSONTransformer \
{ \
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[_class class]];\
}

#define MTL_STRING_TRANSFORMER(_propertyName) \
\
+ (NSValueTransformer*)_propertyName##JSONTransformer { \
    NSValueTransformer *transformer = [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName]; \
    return [MTLValueTransformer transformerWithBlock: ^NSArray *(NSArray *values) { \
        NSMutableArray *transformedValues = [NSMutableArray arrayWithCapacity:values.count]; \
        for (NSString *value in values) { \
            id transformedValue = [transformer transformedValue:value]; \
            if (transformedValue) { \
                [transformedValues addObject:transformedValue]; \
            } \
        } \
        return transformedValues; \
    }]; \
}

@interface MantleBean : MTLModel<MTLJSONSerializing>

@end
