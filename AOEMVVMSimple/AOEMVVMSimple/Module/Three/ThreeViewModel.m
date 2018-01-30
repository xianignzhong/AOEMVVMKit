
//
//  ThreeViewModel.m
//  AOEMVVMSimple
//
//  Created by 夏宁忠 on 2018/1/24.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#import "ThreeViewModel.h"

@implementation ThreeViewModel

AMK_EXPORT_WORKSPACE

-(void)vm_viewDidLoad{
    
    NSLog(@"MMMMMMMMM  ====>  %@", self.params);
    
    AMK_SendMVxNoti_(@"laoxia", @{@"key":@"通知中心返回"})
    
    self.intentData = @{@"intent":@"My name is laoxia"};
    
    AMK_PUSH_Component_Name(@"FourVC", @{@"aaaa":@"bbb"}, {
        
        aimsInterface.view.backgroundColor = [UIColor orangeColor];
    })
}

-(void)onNewIntent:(id)intentData{
    
    NSLog(@"ThreeViewModel======= %@", intentData);
}


-(void)dealloc{
    
    NSLog(@"Three ViewModel dealloc");
}

@end
