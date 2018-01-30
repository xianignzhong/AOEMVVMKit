//
//  UIViewController+AMKLogic.h
//  CoreMLSimple
//
//  Created by 夏宁忠 on 2018/1/11.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AMKEventHandlerPort.h"
#import "AMKViewModel.h"

#define AMKConvertViewModelToType(type) AMKRealPort(type, self.logicHandler)

@interface UIViewController (AMKLogic)

/**
 属性传值
 */
@property (nonatomic, strong)id params;

/**
 *  预设要传递给上一个组件的意图数据
 */
@property (nonatomic, strong)id intentData;

/**
 *  事件处理层 (Runtime解决Category添加属性)
 */
@property (nonatomic, strong, readonly) __kindof id<AMKEventHandlerPort> logicHandler;

/**
 模块来源(上一级)
 */
@property (nonatomic, strong)UIViewController * formComponentVc;

/**
 初始化业逻辑层
 
 @param viewModelClass 业务逻辑Class
 */
-(void)initializeViewModel:(Class)viewModelClass;

/**
 接收回传数据
 
 @param intentData 意图数据
 */
- (void)onNewIntent:(id)intentData;

@end
