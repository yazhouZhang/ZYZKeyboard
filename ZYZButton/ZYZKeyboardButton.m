//
//  ZYZKeyboardButton.m
//  HealthMovement
//
//  Created by AsiaZhang on 16/8/1.
//  Copyright © 2016年 Asia_zhang. All rights reserved.
//

#import "ZYZKeyboardButton.h"
#import "HealthMovementHeader.h"
#import "UIImage+extension.h"
#import "ThirdFrame.h"
@interface ZYZKeyboardButton ()
@property (copy, nonatomic) buttonClickBlock block;

@end

@implementation ZYZKeyboardButton
+ (instancetype)keyButtonWithFrame:(CGRect)frame {
    return [[self alloc] initKeyButtonWithFrame:frame];
}

- (instancetype)initKeyButtonWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        self.titleLabel.font = [UIFont systemFontOfSize:ZYZKeyButtonFont];
        [self setTitleColor:[UIColor colorFromHexCode:@"#333333"] forState:UIControlStateNormal];
        [self setBackgroundImage:[UIImage createImageWithColor:[UIColor colorFromHexCode:@"#dfdfdf"]] forState:UIControlStateHighlighted];
        [self setBackgroundImage:[UIImage createImageWithColor:[UIColor colorFromHexCode:@"#89CEDF"]] forState:UIControlStateNormal];
        [self addTarget:self action:@selector(keyClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (void)setButtonClickBlock:(buttonClickBlock)block {
    self.block = block;
}

- (void)keyClicked:(ZYZKeyboardButton *)button {
    NSString *text = @"";
    if (self.type == ZYZKeyButtonTypeOther || self.type == ZYZKeyButtonTypeSwitch || self.type == ZYZKeyButtonTypeCaseSize) {
        text = button.titleLabel.text;
    }
    self.block(self.type, text);
}

@end
