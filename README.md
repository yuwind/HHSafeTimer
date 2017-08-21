# HHSafeTimer
这是一个安全的timer，不会对self强引用，不需要主动销毁。





- **常用方法**

```objc
/**
 @param interval 时间间隔
 @param block 回调事件，`warning`循环引用
 @return 实例对象
 */
+ (instancetype)safeTimerWithInterval:(NSTimeInterval)interval action:(void(^)(NSInteger count, BOOL *stop))block;

- (instancetype)initWithInterval:(NSTimeInterval)interval action:(void (^)(NSInteger count, BOOL *stop))block;

/**
 暂停timer
 */
- (void)stop;

/**
 恢复timer
 */
- (void)resume;

/**
 销毁timer
 */
- (void)invalidate;


```


- **用法**

```objc
__weak __typeof(self) weakSelf = self;
    self.safeTimer = [HHSafeTimer safeTimerWithInterval:1 action:^(NSInteger count, BOOL *stop) {
        
        weakSelf.titleLabel.text = [NSString stringWithFormat:@"执行了%ld次",count];
        if (count == 10) {//结束条件
            *stop = YES;
            weakSelf.titleLabel.text = @"执行结束了";
        }
        NSLog(@"HHSafeTimer执行了");
    }];
```

