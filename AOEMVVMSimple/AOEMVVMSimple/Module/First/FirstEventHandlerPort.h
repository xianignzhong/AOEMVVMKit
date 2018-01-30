//
//  FirstEventHandlerPort.h
//  AOEMVVMSimple
//
//  Created by 夏宁忠 on 2018/1/23.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC.h>

@protocol FirstEventHandlerPort <NSObject>

@property (nonatomic, strong)RACCommand *btnCommand;

@end
