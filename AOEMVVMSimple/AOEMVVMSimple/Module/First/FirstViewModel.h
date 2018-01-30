//
//  FirstViewModel.h
//  AOEMVVMSimple
//
//  Created by 夏宁忠 on 2018/1/22.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#import "AMKViewModel.h"
#import <ReactiveObjC.h>

@interface FirstViewModel : AMKViewModel

@property (nonatomic, strong)RACCommand *btnCommand;


@end
