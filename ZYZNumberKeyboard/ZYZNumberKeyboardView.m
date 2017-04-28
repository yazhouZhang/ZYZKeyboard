//
//  ZYZNumberKeyboardView.m
//  HealthMovement
//
//  Created by AsiaZhang on 16/8/1.
//  Copyright © 2016年 Asia_zhang. All rights reserved.
//

#import "ZYZNumberKeyboardView.h"
#import "ZYZKeyboardButton.h"
#import "HealthMovementHeader.h"
#import "UIImage+extension.h"
#import "ThirdFrame.h"
static NSInteger const kZYZKeyboardNumberKeyCount = 12;
//static NSInteger const kZYZKeyboardNumberDelIndex = 9; //删除
//static NSInteger const kZYZKeyboardNumberDoneIndex = 11; //完成
static NSInteger const kZYZKeyboardNumberSwitchIndex = 9; //切换
static NSInteger const kZYZKeyboardNumberDelIndex = 11; //删除

@interface ZYZNumberKeyboardView ()
@property (strong, nonatomic) NSArray *numberKeys;

@property (copy, nonatomic) ZYZKeyboardBlock block;
@end

@implementation ZYZNumberKeyboardView

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    int row = 4;
    int column = 3;
    
    CGFloat keyWidth = frame.size.width / column;
    CGFloat keyHeight = frame.size.height / row;
    CGFloat keyX = 0;
    CGFloat keyY = 0;
    
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < kZYZKeyboardNumberKeyCount; i++) {
        ZYZKeyboardButton *button = [ZYZKeyboardButton keyButtonWithFrame:CGRectMake(keyX, keyY, keyWidth, keyHeight)];
        [self addSubview:button];
        WS(weakSelf);
        [button setButtonClickBlock:^(ZYZKeyButtonType buttonType, NSString *text) {
            weakSelf.block(buttonType, text);
        }];
        [array addObject:button];
        if (i == kZYZKeyboardNumberSwitchIndex) { //切换输入法
            button.type = ZYZKeyButtonTypeSwitch;
            [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            [button setBackgroundImage:[UIImage createImageWithColor:[UIColor colorFromHexCode:@"#007AFF"]] forState:UIControlStateNormal];
        } else if (i == kZYZKeyboardNumberDelIndex) { //删除
            button.type = ZYZKeyButtonTypeDel;
            [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
           [button setBackgroundImage:[UIImage createImageWithColor:[UIColor colorFromHexCode:@"#007AFF"]] forState:UIControlStateNormal];
        } else {
            button.type = ZYZKeyButtonTypeOther;
        }
        
        keyX += keyWidth;
        
        if ((i + 1) % column == 0) {
            keyX = 0;
            keyY += keyHeight;
        }
    }
    self.numberKeys = array;
    
    // 水平分隔线
    CGFloat viewX = 0;
    CGFloat viewY = 0;
    CGFloat viewW = frame.size.width;
    CGFloat viewH = 0.5;
    for (int i = 0; i < row; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(viewX, viewY, viewW, viewH)];
        view.backgroundColor = [UIColor colorFromHexCode:@"#dfdfdf"];
        [self addSubview:view];
        
        viewY += keyHeight;
    }
    
    // 垂直分隔线
    viewX = keyWidth;
    viewY = 0;
    viewW = 0.5;
    viewH = frame.size.height;
    for (int i = 0; i < column - 1; i++) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(viewX, viewY, viewW, viewH)];
        view.backgroundColor = [UIColor colorFromHexCode:@"#dfdfdf"];
        [self addSubview:view];
        
        viewX += keyWidth;
    }
}

- (void)exchangeNumber {
    NSMutableArray *numbers = [NSMutableArray array];
    
    int startNum = 0;
    int length = 10;
    
    for (int i = startNum; i < length; i++) {
        [numbers addObject:[NSString stringWithFormat:@"%d", i]];
    }
    
    for (int i = 0; i < self.numberKeys.count; i++) {
        ZYZKeyboardButton *button = self.numberKeys[i];
        
        if (i == kZYZKeyboardNumberDelIndex) {
            [button setTitle:DeleteText forState:UIControlStateNormal];
            continue;
        } else if (i == kZYZKeyboardNumberSwitchIndex) {
            [button setTitle:SwitchABCText forState:UIControlStateNormal];
            continue;
        }
        
        int index = arc4random() % numbers.count;
        [button setTitle:numbers[index] forState:UIControlStateNormal];
        
        [numbers removeObjectAtIndex:index];
    }
}

@end
