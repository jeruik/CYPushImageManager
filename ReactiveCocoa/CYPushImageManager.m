//
//  CYPushImageManager.m
//  TestDemo
//
//  Created by 小菜 on 16/12/12.
//  Copyright © 2016年 蔡凌云. All rights reserved.
//

#import "CYPushImageManager.h"
#import "ReactiveCocoa.h"
#import "LxDBAnything.h"

@implementation CYPushImageManager

+ (void)loadPushImageViewWithWindow:(UIWindow *)window {
    
    // 0.创建要显示的图片
    __block UIView *fullView = [[UIView alloc] initWithFrame:window.bounds];
    fullView.backgroundColor = [UIColor whiteColor];
    
    UIImageView *showImageView = [[UIImageView alloc] initWithFrame:fullView.bounds];
    // 这个下载操作非常耗时，纯演示作用，看你的app启动需求策略
    [showImageView setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://oh95fyv3r.bkt.clouddn.com/3.jpg"]]]];
    [fullView addSubview:showImageView];
    showImageView.userInteractionEnabled = YES;
    
    __block UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake([[UIScreen mainScreen] bounds].size.width-20-60, 30, 60, 20)];
    btn.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
    [btn setTitle:@"3 跳过" forState:UIControlStateNormal];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [fullView addSubview:btn];
    [[btn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        fullView.hidden = YES;
        [fullView removeFromSuperview];
    }];
    
    [window addSubview:fullView];
    
    // 定时器
    __block NSInteger index = 2;
    [[[RACSignal interval:1 onScheduler:[RACScheduler mainThreadScheduler]] take:index] subscribeNext:^(id x) {
        [btn setTitle:[NSString stringWithFormat:@"%ld 跳过",index] forState:UIControlStateNormal];
        index --;
        LxDBAnyVar(index);
        if (index <= 0) {
            [fullView removeFromSuperview];
        }
    }];
}

@end
