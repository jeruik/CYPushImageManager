//
//  ViewController.m
//  ReactiveCocoa
//
//  Created by yz on 15/9/29.
//  Copyright © 2015年 yz. All rights reserved.
//

#import "ViewController.h"
#import <ReactiveCocoa/RACReturnSignal.h>

#import "ReactiveCocoa.h"
#import "RedView.h"
#import "LxDBAnything.h"
#import "Masonry.h"
@interface ViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *btn;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor orangeColor]];
}

@end
