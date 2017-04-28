//
//  ZYZKeyboardView.h
//  HealthMovement
//
//  Created by AsiaZhang on 16/8/1.
//  Copyright © 2016年 Asia_zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZYZKeyboardDefine.h"
static CGFloat ZYZKeyboardViewNumberHeight = 250;

typedef void(^ZYZKeyboardBlock)(ZYZKeyButtonType type, NSString *text);

@interface ZYZKeyboardView : UIView
- (instancetype)initKeyboardWithFrame:(CGRect)frame;
+ (instancetype)keyboardWithFrame:(CGRect)frame;

- (void)setZYZKeyboardBlock:(ZYZKeyboardBlock)block;
@end
