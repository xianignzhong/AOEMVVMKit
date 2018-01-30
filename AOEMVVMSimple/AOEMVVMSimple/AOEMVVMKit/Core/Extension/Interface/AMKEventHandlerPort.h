//
//  AMKEventHandlerPort.h
//  CoreMLSimple
//
//  Created by 夏宁忠 on 2018/1/11.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AMKEventHandlerPort <NSObject>

@required

/**
 绑定视图

 @param view @
 */
- (void)amk_bindView:(id)view;

/**
 接受上一个模块传值

 @param params @
 */
- (void)amk_receiveParams:(id)params;

/**
 来源组建

 @param view @
 */
- (void)amk_fromComponentVc:(id)view;

@end
