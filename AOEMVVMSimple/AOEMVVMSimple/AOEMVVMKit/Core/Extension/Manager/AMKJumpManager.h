//
//  AMKJumpManager.h
//  AOEMVVMSimple
//
//  Created by 夏宁忠 on 2018/1/23.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#define AMKVc __kindof UIViewController

typedef void(^CustomCodeBlock)(AMKVc * _Nonnull aimsInterface);

@interface AMKJumpManager : NSObject

/**
 push 跳转

 @param thisInterface 当前视图
 @param aimsInterface 目标视图
 @param params 传值
 @param customCodeBlock 自定义配制代码Block
 */
+(void)pushJumpMgrThisInterface:(AMKVc *_Nullable)thisInterface AimsInterface:(AMKVc *_Nullable)aimsInterface ValueParams:(nullable id)params customCode:(nullable CustomCodeBlock)customCodeBlock;

/**
 push 跳转 -> 通过类名

 @param thisInterface 当前视图
 @param className 目标视图名
 @param params 传值
 @param customCodeBlock 自定义配制代码Block
 */
+(void)pushJumpMgrThisInterface:(AMKVc *_Nullable)thisInterface AimsClassName:(NSString *_Nonnull)className ValueParams:(nullable id)params customCode:(nullable CustomCodeBlock)customCodeBlock;

/**
 push 跳转 -> 通过StoryBoard快速构建

 @param thisInterface 当前视图
 @param buildName 目标StoryBoard文件
 @param params 传值
 @param customCodeBlock 自定义配制代码Block
 */
+(void)pushJumpMgrThisInterface:(AMKVc *_Nullable)thisInterface AimsSBBuildName:(NSString *_Nonnull)buildName ValueParams:(nullable id)params customCode:(nullable CustomCodeBlock)customCodeBlock;

/**
 present 跳转

 @param thisInterface 当前视图
 @param aimsInterface 目标视图
 @param params 传值
 @param customCodeBlock 自定义配制代码Block
 @param completion 模态完成跳转配置代码Block
 */
+(void)presentJumpMgrThisInterface:(AMKVc *_Nullable)thisInterface AimsInterface:(AMKVc *_Nullable)aimsInterface ValueParams:(nullable id)params customCode:(nullable CustomCodeBlock)customCodeBlock Completion:(void (^ __nullable)(void))completion;

/**
 present 跳转 -> 通过类名

 @param thisInterface 当前视图
 @param className 目标视图名
 @param params 传值
 @param customCodeBlock 自定义配制代码Block
 @param completion 模态完成跳转配置代码Block
 */
+(void)presentJumpMgrThisInterface:(AMKVc *_Nullable)thisInterface AimsClassName:(NSString *_Nonnull)className ValueParams:(nullable id)params customCode:(nullable CustomCodeBlock)customCodeBlock Completion:(void (^ __nullable)(void))completion;

/**
 push 跳转 -> 通过StoryBoard快速构建

 @param thisInterface 当前视图
 @param buildName 目标StoryBoard文件
 @param params 传值
 @param customCodeBlock 自定义配制代码Block
 @param completion 模态完成跳转配置代码Block
 */
+(void)presentJumpMgrThisInterface:(AMKVc *_Nullable)thisInterface AimsSBBuildName:(NSString *_Nonnull)buildName ValueParams:(nullable id)params customCode:(nullable CustomCodeBlock)customCodeBlock Completion:(void (^ __nullable)(void))completion;


@end
