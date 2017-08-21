//
//  ReferenceViewController.m
//  HHSafeTimerDemo
//
//  Created by 豫风 on 2017/8/21.
//  Copyright © 2017年 豫风. All rights reserved.
//

#import "ReferenceViewController.h"
#import "HHSafeTimer.h"

@interface ReferenceViewController ()

@property (nonatomic, strong) HHSafeTimer *safeTimer;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation ReferenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    __weak __typeof(self) weakSelf = self;
    self.safeTimer = [HHSafeTimer safeTimerWithInterval:1 action:^(NSInteger count, BOOL *stop) {
        
        weakSelf.titleLabel.text = [NSString stringWithFormat:@"执行了%ld次",count];
        if (count == 10) {//结束条件
            *stop = YES;
            weakSelf.titleLabel.text = @"执行结束了";
        }
        NSLog(@"HHSafeTimer执行了");
    }];
}

- (void)dealloc
{
    NSLog(@"销毁了控制器%@",self);
}


@end
