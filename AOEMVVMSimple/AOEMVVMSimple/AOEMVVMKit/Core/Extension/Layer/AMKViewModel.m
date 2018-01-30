//
//  AMKViewModel.m
//  CoreMLSimple
//
//  Created by 夏宁忠 on 2018/1/11.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#import "AMKViewModel.h"
#import "UIViewController+AMKLogic.h"

@implementation AMKViewModel

#pragma mark - 生命周期
- (void)vm_viewDidLoad{}
- (void)initCommand{}
- (void)vm_viewWillAppear{}
- (void)vm_viewDidAppear{}
- (void)vm_viewWillDisappear{}
- (void)vm_viewDidDisappear{}

#pragma mark - 接收消息数据
- (void)receiveComponentEventName:(nonnull NSString *)eventName WithData:(nullable id)data {}

- (void)onNewIntent:(id)intentData{}

#pragma mark - Private
//绑定View层
- (void)amk_bindView:(id)view{
    
    self.thisInterface = view;
    
    [self vm_viewDidLoad];
    [self initCommand];
}

// 接受初始化值
- (void)amk_receiveParams:(NSDictionary *)params{
    
    self.params = params;
}

-(void)setIntentData:(id)intentData{
    
    AMKViewModel * model = (AMKViewModel *)self.thisInterface.formComponentVc.logicHandler;
    
    if (self.thisInterface.formComponentVc) {
        
        [self.thisInterface.formComponentVc onNewIntent:intentData];
    }
    
    if (model) {
        
        [model onNewIntent:intentData];
    }
}

@end
