//
//  UIViewController+AMKLogic.m
//  CoreMLSimple
//
//  Created by 夏宁忠 on 2018/1/11.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#import "UIViewController+AMKLogic.h"
#import <objc/runtime.h>
#import "AMKViewModel.h"

@implementation UIViewController (AMKLogic)

//初始化方法
-(void)initializeViewModel:(Class)viewModelClass{
    
    //构建业务逻辑层
    id viewModel;
    if (viewModelClass) {
        
        viewModel = [[viewModelClass alloc]init];
        [self setValue:viewModel forKey:@"logicHandler"];
        
        //传递数据
        if ([self.logicHandler respondsToSelector:@selector(amk_receiveParams:)]) {
            
            [self.logicHandler amk_receiveParams:self.params];
        }
        
        //绑定视图
        if ([self.logicHandler respondsToSelector:@selector(amk_bindView:)]) {
            
            [self.logicHandler amk_bindView:self];
        }
    }
}

/**
 接收回传数据
 
 @param intentData 意图数据
 */
- (void)onNewIntent:(id)intentData{}

#pragma mark - Rumtime property
-(void)setLogicHandler:(__kindof id<AMKEventHandlerPort>)logicHandler{
    
    objc_setAssociatedObject(self, @selector(logicHandler), logicHandler, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(id<AMKEventHandlerPort>)logicHandler{
    
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setParams:(id)params{
    
    objc_setAssociatedObject(self, @selector(params), params, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(id)params{
    
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setIntentData:(id)intentData{
    
    objc_setAssociatedObject(self, @selector(intentData), intentData, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(id)intentData{
    
    return objc_getAssociatedObject(self, _cmd);
}

-(void)setFormComponentVc:(UIViewController *)formComponentVc{
    
    objc_setAssociatedObject(self, @selector(formComponentVc), formComponentVc, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIViewController *)formComponentVc{
    
    return objc_getAssociatedObject(self, _cmd);
}

@end
