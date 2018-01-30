//
//  UIViewController+AMKComponentUI.m
//  CoreMLSimple
//
//  Created by 夏宁忠 on 2018/1/11.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#import "UIViewController+AMKComponentUI.h"
#import "NSObject+AMKSwizzle.h"
#import "AMKViewModel.h"

@implementation UIViewController (AMKComponentUI)

+(void)load{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self amk_swizzleMethod:@selector(viewWillAppear:) withMethod:@selector(amk_viewWillAppear:)];
        [self amk_swizzleMethod:@selector(viewDidAppear:) withMethod:@selector(amk_viewDidAppear:)];
        [self amk_swizzleMethod:@selector(viewWillDisappear:) withMethod:@selector(amk_viewWillDisappear:)];
        [self amk_swizzleMethod:@selector(viewDidDisappear:) withMethod:@selector(amk_viewDidDisappear:)];
    });
}

-(void)amk_viewWillAppear:(BOOL)animated{
    
    [self amk_viewWillAppear:animated];
    
    AMKViewModel * model = (AMKViewModel *)[self valueForKey:@"logicHandler"];
    if (model && [model respondsToSelector:@selector(vm_viewWillAppear)]) {
        
        [model vm_viewWillAppear];
    }
}

- (void)amk_viewDidAppear:(BOOL)animated{
    
    [self amk_viewDidAppear:animated];
    
    AMKViewModel * model = (AMKViewModel *)[self valueForKey:@"logicHandler"];
    if (model && [model respondsToSelector:@selector(vm_viewDidAppear)]) {
        
        [model vm_viewDidAppear];
    }
}

- (void)amk_viewWillDisappear:(BOOL)animated{
    
    [self amk_viewWillDisappear:animated];
    
    AMKViewModel * model = (AMKViewModel *)[self valueForKey:@"logicHandler"];
    if (model && [model respondsToSelector:@selector(vm_viewWillDisappear)]) {
        
        [model vm_viewWillDisappear];
    }
}

- (void)amk_viewDidDisappear:(BOOL)animated{
    
    [self amk_viewDidDisappear:animated];
    
    AMKViewModel * model = (AMKViewModel *)[self valueForKey:@"logicHandler"];
    if (model && [model respondsToSelector:@selector(vm_viewDidDisappear)]) {
        
        [model vm_viewDidDisappear];
    }
}

@end
