//
//  GCD_test.m
//  Test
//
//  Created by kys－1 on 16/1/7.
//  Copyright © 2016年 E-Flying Team. All rights reserved.
//

#import "GCD_test.h"
#import <Foundation/Foundation.h>

@implementation GCD_test
- (void)usage_for_GCD{
    //开始下载 –> 下载中 –> 下载完成
    //  后台执行：
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        // something
    });
    // 主线程执行：
    dispatch_async(dispatch_get_main_queue(), ^{
        // something
    });
    
    // 一次性执行：
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // code to be executed once
    });
    
    // 延迟 2 秒执行：
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        // code to be executed on the main queue after delay
    });
    
    //自定义
    dispatch_queue_t urls_queue = dispatch_queue_create("blog.devtang.com", NULL);
    dispatch_async(urls_queue, ^{
        // your code
    });
}
//》》》》》》》》》》》未使用GCD下载《《《《《《《《《《《《《
static NSOperationQueue * queue;

- (IBAction)someClick:(id)sender {
//    self.indicator.hidden = NO;
//    [self.indicator startAnimating];
    queue = [[NSOperationQueue alloc] init];
    NSInvocationOperation * op = [[[NSInvocationOperation alloc] initWithTarget:self selector:@selector(download) object:nil] autorelease];
    [queue addOperation:op];
}

- (void)download {
    NSURL * url = [NSURL URLWithString:@"http://www.youdao.com"];
    NSError * error;
    NSString * data = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
    if (data != nil) {
        [self performSelectorOnMainThread:@selector(download_completed:) withObject:data waitUntilDone:NO];
    } else {
        NSLog(@"error when download:%@", error);
    }
}

- (void) download_completed:(NSString *) data {
    NSLog(@"call back");
//    [self.indicator stopAnimating];
//    self.indicator.hidden = YES;
//    self.content.text = data;
}

//》》》》》》》》》》》使用GCD下载《《《《《《《《《《《《《
- (void)simpleForGCD{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 原代码块二
        NSURL * url = [NSURL URLWithString:@"http://www.youdao.com"];
        NSError * error;
        NSString * data = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
        if (data != nil) {
            // 原代码块三
            dispatch_async(dispatch_get_main_queue(), ^{
//                [self.indicator stopAnimating];
//                self.indicator.hidden = YES;
//                self.content.text = data;
            });
        } else {
            NSLog(@"error when download:%@", error);
        }
    });
    
}

@end
