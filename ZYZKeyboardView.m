//
//  ZYZKeyboardView.m
//  HealthMovement
//
//  Created by AsiaZhang on 16/8/1.
//  Copyright © 2016年 Asia_zhang. All rights reserved.
//

#import "ZYZKeyboardView.h"
#import "HealthMovementHeader.h"
#import "ThirdFrame.h"
@interface ZYZKeyboardView ()

@property (copy, nonatomic)ZYZKeyboardBlock block;

@end

@implementation ZYZKeyboardView
- (instancetype)initKeyboardWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor colorFromHexCode:@"#f0f0f0"];
    }
    return self;
}

+ (instancetype)keyboardWithFrame:(CGRect)frame {
    return [[self alloc] initKeyboardWithFrame:frame];
}

- (void)setZYZKeyboardBlock:(ZYZKeyboardBlock)block {
    self.block = block;
}
@end
