//
//  AMKWorkSpace.m
//  AOEMVVMSimple
//
//  Created by 夏宁忠 on 2018/1/27.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#import "AMKWorkSpace.h"

@interface AMKWorkSpace ()

@property (nonatomic, weak) __kindof id<AMKComponentRunable> componentRunable;

@property (nonatomic, strong) NSMutableArray *observers;

@end

@implementation AMKWorkSpace

- (instancetype)init
{
    NSAssert(NO, @"请使用-initWithComponentRunable来初始化！");
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wnonnull"
    return [self initWithComponentRunable:nil];
#pragma clang diagnostic pop
}

-(instancetype)initWithComponentRunable:(__kindof id<AMKComponentRunable>)componentRunable{
    
    self = [super init];
    if (self) {
        _componentRunable = componentRunable;
    }
    return self;
}

- (void)sendNotificationForMVxWithName:(NSString *)notiName WithData:(nullable id)data{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:notiName object:nil userInfo:data];
}

- (void)registerMVxNotificationsForTarget:(id)target,... {
    // 如果没有接收方法，直接返回
    if (![self.componentRunable respondsToSelector:@selector(receiveComponentEventName:WithData:)]) {
        NSAssert(NO, @"当前可运行工作空间没有接收方法！");
        return;
    }
    va_list args;
    va_start(args, target);
    while (YES)
    {
        NSString *notiName = va_arg(args, NSString*);
        if (!notiName) {
            break;
        }
        [self _innerRegisterNotiName:notiName];
    }
    va_end(args);
}

- (void)registerMVxNotifications:(NSArray<NSString *> *)notiNames{
    
    if (notiNames == nil || notiNames.count == 0) {
        return;
    }
    for (NSString *name in notiNames) {
        
        [self _innerRegisterNotiName:name];
    }
}

- (void)_innerRegisterNotiName:(NSString *)notiName
{
    
    // 侦听通知
    id<NSObject> observer=
    [[NSNotificationCenter defaultCenter]
     addObserverForName:notiName
     object:nil
     queue:[NSOperationQueue mainQueue]
     usingBlock:^(NSNotification * _Nonnull note) {
         
         //在这里执行
         [self.componentRunable receiveComponentEventName:note.name WithData:note.userInfo];
     }];
    // 添加到侦听数组
    [self.observers addObject:observer];
}

- (NSMutableArray *)observers
{
    if (_observers == nil) {
        _observers = [NSMutableArray array];
    }
    return _observers;
}

// 删除所有侦听
- (void)_removeObservers {
    if (_observers) {
        for (id<NSObject> observer in _observers) {
            [[NSNotificationCenter defaultCenter] removeObserver:observer];
        }
        _observers = nil;
    }
}

-(void)dealloc{
    
    [self _removeObservers];
}

@end
