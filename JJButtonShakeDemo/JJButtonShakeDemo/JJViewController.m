//
//  JJViewController.m
//  JJButtonShakeDemo
//
//  Created by 刘佳杰 on 16/10/17.
//  Copyright © 2016年 刘佳杰. All rights reserved.
//

#import "JJViewController.h"

@interface JJViewController ()

@end

@implementation JJViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake((self.view.frame.size.width - 80) * 0.5, 200, 80, 40)];
    button.backgroundColor = self.view.tintColor;
    button.layer.cornerRadius = 5;
    [button addTarget:self action:@selector(shakeAnimationForView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)shakeAnimationForView:(UIView *)view
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];
    // 获取当前View的position坐标
    CGFloat positionX = view.layer.position.x;
    // 设置抖动的范围
    animation.values = @[@(positionX - 12), @(positionX), @(positionX + 12)];
    // 动画重复的次数
    animation.repeatCount = 3;
    // 动画时间
    animation.duration = 0.06;
    // 设置自动反转
    animation.autoreverses = YES;
    [view.layer addAnimation:animation forKey:nil];
}

@end
