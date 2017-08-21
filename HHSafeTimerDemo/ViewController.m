//
//  ViewController.m
//  HHSafeTimerDemo
//
//  Created by 豫风 on 2017/8/21.
//  Copyright © 2017年 豫风. All rights reserved.
//

#import "ViewController.h"
#import "HHSafeTimer.h"
#import "ReferenceViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) HHSafeTimer *safeTimer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak __typeof(self) weakSelf = self;
    self.safeTimer = [HHSafeTimer safeTimerWithInterval:1 action:^(NSInteger count, BOOL *stop) {
        
        weakSelf.titleLabel.text = [NSString stringWithFormat:@"执行了%ld次",count];
    }];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.safeTimer resume];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.safeTimer stop];
}

- (IBAction)stopTimer:(UIButton *)sender {
    
    [self.safeTimer stop];
}
- (IBAction)resumeTimer:(UIButton *)sender {
    
    [self.safeTimer resume];
}
- (IBAction)pushViewController:(UIButton *)sender {
    
    [self.navigationController pushViewController:[ReferenceViewController new] animated:YES];
}



@end
