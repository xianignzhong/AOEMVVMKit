//
//  NSObject+AMKSwizzle.h
//  CoreMLSimple
//
//  Created by 夏宁忠 on 2018/1/11.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (AMKSwizzle)

/**
 Hook函数  交换两个方法
 
 @param originSEL 原始方法
 @param customSEL 自定义方法
 */
+(void)amk_swizzleMethod:(SEL)originSEL withMethod:(SEL)customSEL;

@end
