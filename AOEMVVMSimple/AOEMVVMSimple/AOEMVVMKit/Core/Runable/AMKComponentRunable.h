//
//  AMKComponentRunable.h
//  AOEMVVMSimple
//
//  Created by 夏宁忠 on 2018/1/27.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@protocol AMKComponentRunable <NSObject>

/**
 *  接收到组件的消息事件
 *
 *  @param eventName  消息名
 *  @param data 消息数据
 */
- (void)receiveComponentEventName:(NSString *)eventName WithData:(nullable id)data;

@end
NS_ASSUME_NONNULL_END
