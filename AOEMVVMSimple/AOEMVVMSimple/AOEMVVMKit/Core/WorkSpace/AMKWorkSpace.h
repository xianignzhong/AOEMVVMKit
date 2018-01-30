//
//  AMKWorkSpace.h
//  AOEMVVMSimple
//
//  Created by 夏宁忠 on 2018/1/27.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AMKComponentRunable.h"

NS_ASSUME_NONNULL_BEGIN
@interface AMKWorkSpace : NSObject

/**
 初始化方法

 @param componentRunable runable
 @return AMKWorkSpace
 */
- (instancetype)initWithComponentRunable:(__kindof id<AMKComponentRunable>)componentRunable NS_DESIGNATED_INITIALIZER;

/**
 *  发送全局通知
 *
 *  @param notiName   通知名
 *  @param data 消息数据
 */
- (void)sendNotificationForMVxWithName:(NSString *)notiName WithData:(nullable id)data;

/**
 *  注册通知(OC专用，Swift编译器转换不了）
 *
 *  @param target 通知侦听目标
 *  @param ...    多个通知名
 */
- (void)registerMVxNotificationsForTarget:(id)target,...;

/**
 *  注册通知
 *
 *  @param notiNames 通知名数组
 */
- (void)registerMVxNotifications:(NSArray<NSString *> *)notiNames;

@end
NS_ASSUME_NONNULL_END
