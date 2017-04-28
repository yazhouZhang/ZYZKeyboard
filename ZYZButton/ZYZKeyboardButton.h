//
//  ZYZKeyboardButton.h
//  HealthMovement
//
//  Created by AsiaZhang on 16/8/1.
//  Copyright © 2016年 Asia_zhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZYZKeyboardDefine.h"
static CGFloat const ZYZKeyButtonFont = 18;

typedef void(^buttonClickBlock)(ZYZKeyButtonType buttonType, NSString *text);
@interface ZYZKeyboardButton : UIButton
@property (assign, nonatomic) ZYZKeyButtonType type;

+ (instancetype)keyButtonWithFrame:(CGRect)frame;
- (instancetype)initKeyButtonWithFrame:(CGRect)frame;
- (void)setButtonClickBlock:(buttonClickBlock)block;

@end
