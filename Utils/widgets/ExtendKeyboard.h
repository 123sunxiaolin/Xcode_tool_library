//
//  ExtendKeyboard.h
//  Here
//
//  Created by kys－1 
//  Copyright (c) 2016年 E-Flying Team. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExtendKeyboard: NSObject

+ (ExtendKeyboard *)addExtendKeyboardViewToParentView:(UIView *)parentView;

- (void)reloadAllTextFieldsFromParentView;

@end
