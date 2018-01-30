//
//  NSObject+AMKSwizzle.m
//  CoreMLSimple
//
//  Created by 夏宁忠 on 2018/1/11.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#import "NSObject+AMKSwizzle.h"
#import <objc/runtime.h>

@implementation NSObject (AMKSwizzle)

+(void)amk_swizzleMethod:(SEL)originSEL withMethod:(SEL)customSEL{
    
    Method originMethod = class_getInstanceMethod([self class], originSEL);
    Method customMethod = class_getInstanceMethod([self class], customSEL);
    BOOL isAdd = class_addMethod(self, originSEL, method_getImplementation(customMethod), method_getTypeEncoding(customMethod));
    if (isAdd) {
        class_replaceMethod(self, customSEL, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
    }else{
        
        method_exchangeImplementations(originMethod, customMethod);
    }
}

@end
