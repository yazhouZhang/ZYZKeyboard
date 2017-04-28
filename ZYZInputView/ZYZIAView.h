//
//  ZYZIAView.h
//  HealthMovement
//
//  Created by AsiaZhang on 16/8/1.
//  Copyright © 2016年 Asia_zhang. All rights reserved.
//


#import <UIKit/UIKit.h>
typedef void (^finishBlock)();

@interface ZYZIAView : UIView
+ (instancetype)iaView;
- (instancetype)initIAView;
@property(nonatomic,copy)finishBlock fisBlock;
@end
