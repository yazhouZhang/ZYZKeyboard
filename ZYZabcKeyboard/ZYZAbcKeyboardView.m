//
//  ZYZAbcKeyboardView.m
//  HealthMovement
//
//  Created by AsiaZhang on 16/8/2.
//  Copyright © 2016年 Asia_zhang. All rights reserved.
//

#import "ZYZAbcKeyboardView.h"
#import "ZYZKeyboardButton.h"
#import "HealthMovementHeader.h"
#import "UIImage+extension.h"
#import "ThirdFrame.h"
static NSInteger const kZYZKeyboardAbcKeyCount = 40;
static NSInteger const kZYZKeyboardAbcCaseSizeIndex = 26; //切换大小写
static NSInteger const kZYZKeyboardAbcDelIndex = 32; //删除
static NSInteger const kZYZKeyboardAbcSwitchIndex = 33; //切换输入发
static NSInteger const kZYZKeyboardAbcDoneIndex = 39; //完成

@interface ZYZAbcKeyboardView ()
@property (strong, nonatomic) NSArray *numberKeys;

@property (copy, nonatomic) ZYZKeyboardBlock block;
@end

@implementation ZYZAbcKeyboardView
- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    int row = 5;
    int columna = 10;
    int columnb = 8;
    int columnc = 7;
    int space = 3;
    // 10,8,8,7,7
    
    CGFloat keyWidtha = [self countWidth:columna withFrame:frame];
    CGFloat keyWidthb = [self countWidth:columnb withFrame:frame];
    CGFloat keyWidthc = (keyWidthb + space)/2 + keyWidthb ;
    CGFloat keyHeight = (frame.size.height - (row-1) * space) / row;
    CGFloat keyX = space;
    CGFloat keyY = space;
    
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < kZYZKeyboardAbcKeyCount; i++) {
        if(i < 10){
            ZYZKeyboardButton *button = [ZYZKeyboardButton keyButtonWithFrame:CGRectMake(keyX, keyY, keyWidtha, keyHeight)];
            [self addSubview:button];
            WS(weakSelf);
            [button setButtonClickBlock:^(ZYZKeyButtonType buttonType, NSString *text) {
                weakSelf.block(buttonType, text);
            }];
            [array addObject:button];
            button.type = ZYZKeyButtonTypeOther;
            keyX += keyWidtha + space;
            if ((i + 1) % columna == 0) {
                keyX = space;
                keyY += keyHeight + space;
            }
        }else if(i < 26 && i > 9){
            ZYZKeyboardButton *button = [ZYZKeyboardButton keyButtonWithFrame:CGRectMake(keyX, keyY, keyWidthb, keyHeight)];
            [self addSubview:button];
            WS(weakSelf);
            [button setButtonClickBlock:^(ZYZKeyButtonType buttonType, NSString *text) {
                weakSelf.block(buttonType, text);
            }];
            [array addObject:button];
            button.type = ZYZKeyButtonTypeOther;
            keyX += keyWidthb + space;
            if ((i + 1 - 10) % columnb == 0) {
                keyX = space;
                keyY += keyHeight + space;
            }
        }else{
            CGFloat temp = 0;
            if (i == kZYZKeyboardAbcCaseSizeIndex || i == kZYZKeyboardAbcDelIndex || i == kZYZKeyboardAbcSwitchIndex || i == kZYZKeyboardAbcDoneIndex) {
                temp = keyWidthc;
            }else{
                temp = keyWidthb;
            }
            ZYZKeyboardButton *button = [ZYZKeyboardButton keyButtonWithFrame:CGRectMake(keyX, keyY, temp, keyHeight)];
            [self addSubview:button];
            WS(weakSelf);
            [button setButtonClickBlock:^(ZYZKeyButtonType buttonType, NSString *text) {
                weakSelf.block(buttonType, text);
            }];
            [array addObject:button];
            if(i == kZYZKeyboardAbcCaseSizeIndex){
                button.type = ZYZKeyButtonTypeCaseSize;
                [button setBackgroundImage:[UIImage createImageWithColor:[UIColor colorFromHexCode:@"#007AFF"]] forState:UIControlStateNormal];
                keyX = ((i - 26)%7)*(keyWidthb + space) + keyWidthc + space + space;
            }else if(i == kZYZKeyboardAbcDelIndex){
                button.type = ZYZKeyButtonTypeDel;
                keyX = space;
                keyY += keyHeight + space;
                [button setBackgroundImage:[UIImage createImageWithColor:[UIColor colorFromHexCode:@"#007AFF"]] forState:UIControlStateNormal];
            }else if(i == kZYZKeyboardAbcSwitchIndex){
                button.type = ZYZKeyButtonTypeSwitch;
                keyX = ((i - 33)%7)*(keyWidthb + space) + keyWidthc + space + space;
                [button setBackgroundImage:[UIImage createImageWithColor:[UIColor colorFromHexCode:@"#007AFF"]] forState:UIControlStateNormal];
            }else if(i == kZYZKeyboardAbcDoneIndex){
                button.type = ZYZKeyButtonTypeDone;
                [button setBackgroundImage:[UIImage createImageWithColor:[UIColor colorFromHexCode:@"#007AFF"]] forState:UIControlStateNormal];
            }else{
                keyX = ((i - 26)%7)*(keyWidthb + space) + keyWidthc + space + space;
                button.type = ZYZKeyButtonTypeOther;
            }
        }
    }
    self.numberKeys = array;
//    // 水平分隔线
//    CGFloat viewX = 0;
//    CGFloat viewY = 0;
//    CGFloat viewW = frame.size.width;
//    CGFloat viewH = 0.5;
//    for (int i = 0; i < row; i++) {
//        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(viewX, viewY, viewW, viewH)];
//        view.backgroundColor = [UIColor colorFromHexCode:@"#dfdfdf"];
//        [self addSubview:view];
//        
//        viewY += keyHeight;
//    }
//    
//    // 垂直分隔线
//    viewX = keyWidth;
//    viewY = 0;
//    viewW = 0.5;
//    viewH = frame.size.height;
//    for (int i = 0; i < column - 1; i++) {
//        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(viewX, viewY, viewW, viewH)];
//        view.backgroundColor = [UIColor colorFromHexCode:@"#dfdfdf"];
//        [self addSubview:view];
//        
//        viewX += keyWidth;
//    }
}

-(CGFloat)countWidth:(NSInteger)num withFrame:(CGRect)frame{
    return (frame.size.width - 3 * (num + 1)) / num;
}

//-(NSArray*)createButton:(CGFloat*)width{
//    ZYZKeyboardButton *button = [ZYZKeyboardButton keyButtonWithFrame:CGRectMake(keyX, keyY, width, keyHeight)];
//    [self addSubview:button];
//    WS(weakSelf);
//    [button setButtonClickBlock:^(ZYZKeyButtonType buttonType, NSString *text) {
//        weakSelf.block(buttonType, text);
//    }];
//    [array addObject:button];
//}

- (void)exchangeLetter {
   NSMutableArray *numbers = [NSMutableArray array];
    
    int startNum = 0;
    int length = 26;
    for (int i = startNum; i < length; i++) {
        [numbers addObject:[NSString stringWithFormat:@"%d", i + 97]];
    }
    for (int i = 0; i < self.numberKeys.count; i++) {
        ZYZKeyboardButton *button = self.numberKeys[i];
        if (i == kZYZKeyboardAbcDelIndex) {
            [button setTitle:DeleteText forState:UIControlStateNormal];
            continue;
        } else if (i == kZYZKeyboardAbcSwitchIndex) {
            [button setTitle:Swicth123Text forState:UIControlStateNormal];
            continue;
        }else if (i == kZYZKeyboardAbcCaseSizeIndex) {
            [button setTitle:ToABC forState:UIControlStateNormal];
            continue;
        }else if (i == kZYZKeyboardAbcDoneIndex) {
            [button setTitle:DoneText forState:UIControlStateNormal];
            continue;
        }
        if (i < 10) {
            [button setTitle:[NSString stringWithFormat:@"%d",i] forState:UIControlStateNormal];
        }else{
            int index = arc4random() % numbers.count;
            [button setTitle:[NSString stringWithFormat:@"%c",[numbers[index] intValue]] forState:UIControlStateNormal];
            [numbers removeObjectAtIndex:index];
        }
    }
}

-(void)uppercaseToABC{
    for (int i = 0; i < self.numberKeys.count; i++) {
        ZYZKeyboardButton *button = self.numberKeys[i];
        if (i == kZYZKeyboardAbcDelIndex) {
            [button setTitle:DeleteText forState:UIControlStateNormal];
            continue;
        } else if (i == kZYZKeyboardAbcSwitchIndex) {
            [button setTitle:Swicth123Text forState:UIControlStateNormal];
            continue;
        }else if (i == kZYZKeyboardAbcCaseSizeIndex) {
            [button setTitle:Toabc forState:UIControlStateNormal];
            continue;
        }else if (i == kZYZKeyboardAbcDoneIndex) {
            [button setTitle:DoneText forState:UIControlStateNormal];
            continue;
        }
        if (i < 10) {
            [button setTitle:[NSString stringWithFormat:@"%d",i] forState:UIControlStateNormal];
        }else{
            NSString *temp = button.titleLabel.text;
            [button setTitle:[temp uppercaseString] forState:UIControlStateNormal];
        }
    }
}

-(void)lowercaseToabc{
    for (int i = 0; i < self.numberKeys.count; i++) {
        ZYZKeyboardButton *button = self.numberKeys[i];
        if (i == kZYZKeyboardAbcDelIndex) {
            [button setTitle:DeleteText forState:UIControlStateNormal];
            continue;
        } else if (i == kZYZKeyboardAbcSwitchIndex) {
            [button setTitle:Swicth123Text forState:UIControlStateNormal];
            continue;
        }else if (i == kZYZKeyboardAbcCaseSizeIndex) {
            [button setTitle:ToABC forState:UIControlStateNormal];
            continue;
        }else if (i == kZYZKeyboardAbcDoneIndex) {
            [button setTitle:DoneText forState:UIControlStateNormal];
            continue;
        }
        if (i < 10) {
            [button setTitle:[NSString stringWithFormat:@"%d",i] forState:UIControlStateNormal];
        }else{
            NSString *temp = button.titleLabel.text;
            [button setTitle:[temp lowercaseString] forState:UIControlStateNormal];
        }
    }
}
@end
