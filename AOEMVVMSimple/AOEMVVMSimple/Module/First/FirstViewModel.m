//
//  FirstViewModel.m
//  AOEMVVMSimple
//
//  Created by 夏宁忠 on 2018/1/22.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#import "FirstViewModel.h"
#import "ThreeViewController.h"

@implementation FirstViewModel

AMK_EXPORT_WORKSPACE

-(void)vm_viewDidLoad{
    
    AMK_RegisterMVxNotis_(@"laoxia")
    
}

-(void)initCommand{
    
    AMK_CEXE_Begin
    
    AMK_CEXE_(self.btnCommand, {
        
        [self erexsdsds];
    })
}

-(void)receiveComponentEventName:(NSString *)eventName WithData:(id)data{
    
    NSLog(@"====%@===%@",eventName,data);
    
    AMK_EventIs_(@"laoxia", {
        
        NSLog(@"名为老夏的 通知中心");
    })
    
}

-(void)onNewIntent:(id)intentData{
    
    NSLog(@"FirstViewModel ===========>  %@", intentData);
}

-(void)erexsdsds{

#warning PUSH
    //init 方式
    ThreeViewController * three;

    three = [[ThreeViewController alloc]init];

    AMK_PUSH_Component_(three, @{@"str":@"aaaaa"}, {

        aimsInterface.title = @"Three";
        aimsInterface.view.backgroundColor = [UIColor redColor];
    })
    
    //懒人专用 className
//    AMK_PUSH_Component_Name(@"ThreeViewController", @{@"str":@"aaaaa"}, {
//
//        aimsInterface.title = @"Three";
//        aimsInterface.view.backgroundColor = [UIColor redColor];
//
//        CATransition *animation = [CATransition animation];
//        animation.duration = 0.5;
//        animation.timingFunction = [CAMediaTimingFunction functionWithName:@"easeOut"];
//        animation.type = @"cube";
//        [aimsInterface.navigationController.view.layer addAnimation:animation forKey:@"animation"];
//    })
    
//    AMK_PUSH_Component_Name(@"ThreeViewController&&nav", @{@"str":@"aaaaa"}, {
//
//        aimsInterface.title = @"Three";
//        aimsInterface.view.backgroundColor = [UIColor redColor];
//
//        CATransition *animation = [CATransition animation];
//        animation.duration = 0.5;
//        animation.timingFunction = [CAMediaTimingFunction functionWithName:@"easeOut"];
//        animation.type = @"cube";
//        [aimsInterface.navigationController.view.layer addAnimation:animation forKey:@"animation"];
//    })
    
    //SB - 可视化 - 骚操作
//    [AMKJumpManager pushJumpMgrThisInterface:self.thisInterface AimsSBBuildName:@" SB - Main - aaa " ValueParams:@{@"str":@"aaaaa"} customCode:^(__kindof UIViewController * _Nonnull aimsInterface) {
//
//        aimsInterface.title = @"Three";
//        aimsInterface.view.backgroundColor = [UIColor redColor];
//
//        CATransition *animation = [CATransition animation];
//        animation.duration = 0.5;
//        animation.timingFunction = [CAMediaTimingFunction functionWithName:@"easeOut"];
//        animation.type = @"cube";
//        [aimsInterface.navigationController.view.layer addAnimation:animation forKey:@"animation"];
//    }];
    
//    AMK_PUSH_Component_StoryBoard(@" SB - Main - aaa ", @{@"str":@"aaaaa"}, {
//
//        aimsInterface.title = @"Three";
//        aimsInterface.view.backgroundColor = [UIColor redColor];
//    })
    
#warning Present
//    ThreeViewController * three = [[ThreeViewController alloc]init];
//    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:three];
    
//    AMK_Present_Component_(nav, @{@"str":@"aaaaa"}, {}, {})
    
//    [AMKJumpManager presentJumpMgrThisInterface:self.thisInterface AimsClassName:@"ThreeViewController && nav" ValueParams:@{@"str":@"aaaaa"} customCode:nil Completion:nil];
    
//    AMK_Present_Component_Name(@"ThreeViewController && nav", @{@"str":@"aaaaa"},{}, {})
    
//    AMK_Present_Component_StoryBoard(@" SB - Main - aaa ", @{@"str":@"aaaaa"}, {}, {})
    
    
    
    
}

-(void)vm_viewWillAppear{
    
    NSLog(@"firstVM -  vm_viewWillAppear");
}

@end
