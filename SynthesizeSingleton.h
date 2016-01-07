//
//  SynthesizeSingleton.h
//  Test
//
//  Created by kys－1 on 16/1/7.
//  Copyright © 2016年 E-Flying Team. All rights reserved.
//

#define SYNTHESIZE_SINGLETON_FOR_HEADER(className) \
\
+ (className *)sharedInstance;


#define SYNTHESIZE_SINGLETON_FOR_CLASS(classname) \
\
+ (classname *)sharedInstance \
{ \
static classname *shared##classname = nil;\
static dispatch_once_t onceToken;\
dispatch_once(&onceToken, ^{ \
shared##classname = [[self alloc] init]; \
}); \
return shared##classname; \
}
