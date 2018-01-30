//
//  AMKUnitMarco.h
//  CoreMLSimple
//
//  Created by 夏宁忠 on 2018/1/11.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#ifndef AMKUnitMarco_h
#define AMKUnitMarco_h

/**
 转到新的子接口类型或子对象
 */
#define AMKRealPort(nowPort, oldPort) ((nowPort)(oldPort))

//弱引用
#pragma clang diagnostic ignored "-Wunused-variable"
#define AMK_Weakify \
__weak __typeof__ (self) self_weak_ = self;
#define AMK_Strongify \
__strong __typeof__(self) self = self_weak_;

/*
 基于ReactiveCocoa的命令绑定
 */
#define AMK_C_(UIButton,EventHandler,Command) UIButton.rac_command = [EventHandler Command];

/**
 基于ReactiveCocoa的快速命令执行宏
 */
#define AMK_CEXE_Begin AMK_Weakify

/*
 绑定命令与执行代码（默认返回空信号，可以手动返回新信号）
 */
#define AMK_CEXE_(commandRef, ExecuteCode) \
commandRef = [[RACCommand alloc]initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) { \
AMK_Strongify \
[self self]; \
ExecuteCode \
return [RACSignal empty]; \
}]; \

/*
 基于enable信号，绑定命令与执行代码（默认返回空信号，可手动返回新的信号）
 */
#define AMK_CEXE_Enable_(commandRef, enableSignal, ExecuteCode)\
commandRef = [[RACCommand alloc] initWithEnabled:enableSignal signalBlock:^RACSignal *(id input) {\
AMK_Strongify \
[self self]; \
ExecuteCode \
return [RACSignal empty]; \
}];

#pragma mark - 用于ViewModel页面跳转快速构建宏 push & present
/**
 用于ViewModel PUSH操作 -> [[Class alloc] init]方式初始化
 
 @param component 目标视图(通过实例化)
 @param params 属性传值（NSDictionary）
 @param executeCode 目标视图自定义配置代码块(aimsInterface)
 
 @return
 */
#define AMK_PUSH_Component_(component,params,executeCode) \
[AMKJumpManager pushJumpMgrThisInterface:self.thisInterface AimsInterface:component ValueParams:params customCode:^(AMKVc * _Nonnull aimsInterface) { \
    executeCode \
}];

/**
 用于ViewModel PUSH操作 (ClassName) ->String 直接传入类名方式  ClassName&&nav(push模式不建议 但不影响)

 @param componentName 目标视图类名
 @param params 属性传值（NSDictionary）
 @param executeCode 目标视图自定义配置代码块(aimsInterface)
 @return 
 */
#define AMK_PUSH_Component_Name(componentName,params,executeCode) \
[AMKJumpManager pushJumpMgrThisInterface:self.thisInterface AimsClassName:componentName ValueParams:params customCode:^(AMKVc * _Nonnull aimsInterface) { \
    executeCode \
}];


/**
 用于ViewModel PUSH操作 (StoryBoard) -> 快速构建可视化视图方式

 @param storyBoardName StoryBoard名称
 @param params 属性传值（NSDictionary）
 @param executeCode 目标视图自定义配置代码块(aimsInterface)
 @return 
 */
#define AMK_PUSH_Component_StoryBoard(storyBoardName,params,executeCode) \
[AMKJumpManager pushJumpMgrThisInterface:self.thisInterface AimsSBBuildName:storyBoardName ValueParams:params customCode:^(AMKVc * _Nonnull aimsInterface) { \
    executeCode \
}];

/**
 用于ViewModel Present操作
 
 @param component 目标视图(通过实例化)
 @param executeCode 目标视图自定义配置代码块(aimsInterface)
 @param completion 执行完成
 @return
 */
#define AMK_Present_Component_(component,params,executeCode,completion) \
[AMKJumpManager presentJumpMgrThisInterface:self.thisInterface AimsInterface:component ValueParams:params customCode:^(__kindof UIViewController * _Nonnull aimsInterface) { \
    {executeCode} \
} Completion:^{ \
    completion \
}];

/**
 用于ViewModel Present操作 (ClassName) ->String 直接传入类名方式  ClassName&&nav

 @param componentName 目标视图类名
 @param params 属性传值（NSDictionary）
 @param executeCode 目标视图自定义配置代码块(aimsInterface)
 @param completion 模态完成自定义代码块
 @return
 */
#define AMK_Present_Component_Name(componentName,params,executeCode,completion) \
[AMKJumpManager presentJumpMgrThisInterface:self.thisInterface AimsClassName:componentName ValueParams:params customCode:^(__kindof UIViewController * _Nonnull aimsInterface) { \
    executeCode \
} Completion:^{ \
    completion \
}];

/**
 用于ViewModel Present操作 (StoryBoard) -> 快速构建可视化视图方式

 @param storyBoardName storyBoardName descriptionStoryBoard名称
 @param params 属性传值（NSDictionary
 @param executeCode 目标视图自定义配置代码块(aimsInterface)
 @param completion 模态完成自定义代码块
 @return
 */
#define AMK_Present_Component_StoryBoard(storyBoardName,params,executeCode,completion) \
[AMKJumpManager presentJumpMgrThisInterface:self.thisInterface AimsSBBuildName:storyBoardName ValueParams:params customCode:^(__kindof UIViewController * _Nonnull aimsInterface) { \
    executeCode \
} Completion:^{ \
    completion \
}];

#pragma mark - 用于ViewModel通知中心快速构建宏设置
/**
 导出作为可运行组件
 */
#undef AMK_EXPORT_WORKSPACE
#define AMK_EXPORT_WORKSPACE \
- (instancetype)init \
{ \
self = [super init]; \
if (self) { \
[self setValue:[[AMKWorkSpace alloc] initWithComponentRunable:self] forKeyPath:@"workSpace"]; \
} \
return self; \
} \

/**
 发通知

 @param notiName 通知名称
 @param sendData 发送数据
 @return
 */
#define AMK_SendMVxNoti_(notiName,sendData) \
[self.workSpace sendNotificationForMVxWithName:notiName WithData:sendData];

/**
 注册通知（...,nil）-> OC

 @param ... 参数为多个通知名，使用,分开
 @return
 */
#define AMK_RegisterMVxNotis_(...) \
[self.workSpace registerMVxNotificationsForTarget:self,##__VA_ARGS__,nil];

/**
 注册通知 (数组)

 @param names 多个通知名
 @return
 */
#define AMK_RegisterMVxNotis__(notiNames) \
[self.workSpace registerMVxNotifications:notiNames];

/**
 快速事件类型匹配的宏

 @param eventName 通州名
 @param executeCode 代码块
 @return 
 */
#define AMK_EventIs_(eventName,executeCode) \
if ([eventName isEqualToString:eventName]) { \
executeCode \
return; \
}

#endif /* AMKUnitMarco_h */
