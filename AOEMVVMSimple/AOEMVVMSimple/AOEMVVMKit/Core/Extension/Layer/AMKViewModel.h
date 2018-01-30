//
//  AMKViewModel.h
//  CoreMLSimple
//
//  Created by 夏宁忠 on 2018/1/11.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AMKUnitMarco.h"
#import "AMKJumpManager.h"
#import "AMKWorkSpace.h"

NS_ASSUME_NONNULL_BEGIN
@interface AMKViewModel : NSObject<AMKComponentRunable>

/**
 当前绑定的视图
 */
@property (nonatomic, weak)AMKVc * thisInterface;

/**
 上一个模块传值
 */
@property (nonatomic, strong)id params;

/**
 *  预设要传递给上一个组件的意图数据 (需要实现AMKJumpManager 或者指定)
 */
@property (nonatomic, copy, nullable) id intentData;

/**
 工作空间 传递通知
 */
@property (nonatomic, strong, readonly)AMKWorkSpace * workSpace;

#pragma mark - 生命周期
- (void)vm_viewDidLoad;
- (void)initCommand;
- (void)vm_viewWillAppear;
- (void)vm_viewDidAppear;
- (void)vm_viewWillDisappear;
- (void)vm_viewDidDisappear;

/**
 接收回传数据

 @param intentData 意图数据
 */
- (void)onNewIntent:(id)intentData;

@end
NS_ASSUME_NONNULL_END
