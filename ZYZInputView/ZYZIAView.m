//
//  ZYZIAView.m
//  HealthMovement
//
//  Created by AsiaZhang on 16/8/1.
//  Copyright © 2016年 Asia_zhang. All rights reserved.
//

#import "ZYZIAView.h"

@implementation ZYZIAView
+ (instancetype)iaView{
    return [[self alloc] initIAView];
}
- (instancetype)initIAView{
    if (self = [super init]) {
        self = [[[NSBundle mainBundle] loadNibNamed:@"IaView" owner:self options:nil] lastObject];
    }
    return self;
}

- (IBAction)finshButtonClick:(UIButton *)sender {
    if (self.fisBlock) {
        self.fisBlock(); //回调
    }
}

@end
