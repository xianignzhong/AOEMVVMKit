//
//  AMKJumpManager.m
//  AOEMVVMSimple
//
//  Created by 夏宁忠 on 2018/1/23.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#import "AMKJumpManager.h"
#import "UIViewController+AMKLogic.h"
#import "AMKParser.h"

@implementation AMKJumpManager

+(void)pushJumpMgrThisInterface:(AMKVc *)thisInterface AimsInterface:(AMKVc *)aimsInterface ValueParams:(NSDictionary *)params customCode:(nullable CustomCodeBlock)customCodeBlock{
    
    if (thisInterface.navigationController && aimsInterface) {
        
        if (params) {
            
            aimsInterface.params = params;
        }
        
        aimsInterface.formComponentVc = thisInterface;
        
        [thisInterface.navigationController pushViewController:aimsInterface animated:YES];
        
        if (customCodeBlock) {

            customCodeBlock(aimsInterface);
        }
        
    }else{

        NSAssert(0, @"thisInterface没有通过Nav管理 或者 aimsInterface对象并不存在");
    }
}

+(void)pushJumpMgrThisInterface:(__kindof UIViewController *)thisInterface AimsClassName:(NSString *)className ValueParams:(NSDictionary *)params customCode:(CustomCodeBlock)customCodeBlock{
    
    if (thisInterface.navigationController && className) {
        
        AMKClassNameFormat * format = [AMKParser parseClassName:className];
        
        if (format.isError == YES) {
            
            NSAssert(0, @"className 不正确");
        }
        
        if (format.amk_nav && ![format.amk_nav isEqualToString:@"nav"]) {
            
            NSAssert(0, @"className 组合不正确");
        }
        
        Class componentClass = NSClassFromString(format.amk_className);
        AMKVc * aimsInterface = [[componentClass alloc] init];
        
        if (aimsInterface) {
            
            aimsInterface.formComponentVc = thisInterface;
            
            if (params) {
                
                aimsInterface.params = params;
            }
            
            [thisInterface.navigationController pushViewController:aimsInterface animated:YES];
            
            if (customCodeBlock) {
                
                customCodeBlock(aimsInterface);
            }
            
        }else{
            
            NSAssert(0, @"className 不正确");
        }
        
    }else{
        
        NSAssert(0, @"thisInterface没有通过Nav管理 或者 className不存在");
    }
    
}

+(void)pushJumpMgrThisInterface:(__kindof UIViewController *)thisInterface AimsSBBuildName:(NSString *)buildName ValueParams:(NSDictionary *)params customCode:(CustomCodeBlock)customCodeBlock{
    
    if (thisInterface.navigationController && buildName) {
        
        AMKSBBuildNameFormat * format = [AMKParser parseSBBuildName:buildName];
        if (format.isError == YES) {
            
            NSAssert(0, @"buildName 不正确");
        }else{
            
            UIStoryboard * sb = [UIStoryboard storyboardWithName:format.amk_sbName bundle:nil];
            
            AMKVc * aimsInterface;
            if (!format.amk_identifier || [format.amk_identifier isEqualToString:@""]) {
                
                aimsInterface = [sb instantiateInitialViewController];
            }else{
                
                aimsInterface = [sb instantiateViewControllerWithIdentifier:format.amk_identifier];
            }
            
            if (aimsInterface) {
                
                aimsInterface.formComponentVc = thisInterface;
                
                if (params) {
                    
                    aimsInterface.params = params;
                }
                
                [thisInterface.navigationController pushViewController:aimsInterface animated:YES];
                
                if (customCodeBlock) {
                    
                    customCodeBlock(aimsInterface);
                }
                
            }else{
                
                NSAssert(0, @"buildName 不正确");
            }
        }
        
    }else{
        
        NSAssert(0, @"thisInterface没有通过Nav管理 或者 buildName不存在");
    }
    
}


+(void)presentJumpMgrThisInterface:(AMKVc *)thisInterface AimsInterface:(AMKVc *)aimsInterface ValueParams:(nullable NSDictionary *)params customCode:(CustomCodeBlock)customCodeBlock Completion:(void (^ __nullable)(void))completion{
    
    if (thisInterface && aimsInterface) {
        
        if ([aimsInterface isKindOfClass:[UINavigationController class]]) {
            
            UINavigationController * nav = (UINavigationController *)aimsInterface;
            if (nav.viewControllers.count>0) {
                
                AMKVc * vc = nav.viewControllers.firstObject;
                
                if (customCodeBlock) {
                    
                    customCodeBlock(vc);
                }
                
                vc.formComponentVc = thisInterface;
                
                if (params) {
                    
                    vc.params = params;
                }
            }
            
        }else{
            
            if (customCodeBlock) {
                
                customCodeBlock(aimsInterface);
            }
            
            aimsInterface.formComponentVc = thisInterface;
            
            if (params) {
                
                aimsInterface.params = params;
            }
        }
        
        //是否有导航控制器
        AMKVc * nextInterface = aimsInterface.navigationController ?:aimsInterface;
        //如果当前控制器未被Present
        if (thisInterface.presentingViewController == nil && !thisInterface.isBeingDismissed && thisInterface.view.window) {
        }else{
            
            //根控制器
            UIViewController * rootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
            if (rootVC != thisInterface.presentingViewController) {
                
                thisInterface = rootVC;
            }else if ([rootVC isKindOfClass:[UITabBarController class]]){
                
                thisInterface = ((UITabBarController *)rootVC).selectedViewController;
            }
        }
        
        if (nextInterface) {
            
            [thisInterface presentViewController:nextInterface animated:YES completion:^{
                
                completion();
            }];
        }else{
            
            NSAssert(0, @"className 不正确");
        }

    }else{
        
        NSAssert(0, @"thisInterface对象并不存在 或者 aimsInterface对象并不存在");
    }
}

+(void)presentJumpMgrThisInterface:(__kindof UIViewController *)thisInterface AimsClassName:(NSString *)className ValueParams:(NSDictionary *)params customCode:(CustomCodeBlock)customCodeBlock Completion:(void (^)(void))completion{
    
    if (thisInterface && className) {
        
        AMKClassNameFormat * format = [AMKParser parseClassName:className];
        
        if (format.isError == YES) {
            
            NSAssert(0, @"className 不正确");
        }
        
        if (format.amk_nav && ![format.amk_nav isEqualToString:@"nav"]) {
            
            NSAssert(0, @"className 组合不正确");
        }
        
        Class componentClass = NSClassFromString(format.amk_className);
        AMKVc * aimsInterface = [[componentClass alloc] init];
        
        if (aimsInterface) {
            
            if (customCodeBlock) {
                
                customCodeBlock(aimsInterface);
            }
            
            aimsInterface.formComponentVc = thisInterface;
            
            if (params) {
                
                aimsInterface.params = params;
            }
            
            if (format.amk_nav && [format.amk_nav isEqualToString:@"nav"]) {
                
                UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:aimsInterface];
            }
        }
        
        //是否有导航控制器
        AMKVc * nextInterface = aimsInterface.navigationController ?:aimsInterface;
        //如果当前控制器未被Present
        if (thisInterface.presentingViewController == nil && !thisInterface.isBeingDismissed && thisInterface.view.window) {
        }else{
            
            //根控制器
            UIViewController * rootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
            if (rootVC != thisInterface.presentingViewController) {
                
                thisInterface = rootVC;
            }else if ([rootVC isKindOfClass:[UITabBarController class]]){
                
                thisInterface = ((UITabBarController *)rootVC).selectedViewController;
            }
        }
        
        if (nextInterface) {
            
            [thisInterface presentViewController:nextInterface animated:YES completion:^{
                
                if (completion) {
                    
                    completion();
                }
            }];
        }else{
            
            NSAssert(0, @"className 不正确");
        }
        
    }else{
        
        NSAssert(0, @"thisInterface对象并不存在 或者 className不存在");
    }
}

+(void)presentJumpMgrThisInterface:(__kindof UIViewController *)thisInterface AimsSBBuildName:(NSString *)buildName ValueParams:(NSDictionary *)params customCode:(CustomCodeBlock)customCodeBlock Completion:(void (^)(void))completion{
    
    if (thisInterface && buildName) {
        
        AMKSBBuildNameFormat * format = [AMKParser parseSBBuildName:buildName];
        if (format.isError == YES) {
            
            NSAssert(0, @"buildName 不正确");
        }else{
            
            UIStoryboard * sb = [UIStoryboard storyboardWithName:format.amk_sbName bundle:nil];
            
            AMKVc * aimsInterface;
            if (!format.amk_identifier || [format.amk_identifier isEqualToString:@""]) {
                
                aimsInterface = [sb instantiateInitialViewController];
            }else{
                
                aimsInterface = [sb instantiateViewControllerWithIdentifier:format.amk_identifier];
            }
            
            if (aimsInterface) {
                
                if ([aimsInterface isKindOfClass:[UINavigationController class]]) {
                    
                    UINavigationController * nav = (UINavigationController *)aimsInterface;
                    if (nav.viewControllers.count>0) {
                        
                        AMKVc * vc = nav.viewControllers.firstObject;
                        
                        if (customCodeBlock) {
                            
                            customCodeBlock(vc);
                        }
                        
                        vc.formComponentVc = thisInterface;
                        
                        if (params) {
                            
                            vc.params = params;
                        }
                    }
                    
                }else{
                    
                    if (customCodeBlock) {
                        
                        customCodeBlock(aimsInterface);
                    }
                    
                    aimsInterface.formComponentVc = thisInterface;
                    
                    if (params) {
                        
                        aimsInterface.params = params;
                    }
                }
                
                //是否有导航控制器
                AMKVc * nextInterface = aimsInterface.navigationController ?:aimsInterface;
                
                //如果当前控制器未被Present
                if (thisInterface.presentingViewController == nil && !thisInterface.isBeingDismissed && thisInterface.view.window) {
                }else{
                    
                    //根控制器
                    UIViewController * rootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
                    if (rootVC != thisInterface.presentingViewController) {
                        
                        thisInterface = rootVC;
                    }else if ([rootVC isKindOfClass:[UITabBarController class]]){
                        
                        thisInterface = ((UITabBarController *)rootVC).selectedViewController;
                    }
                }
                
                if (nextInterface) {
                    
                    [thisInterface presentViewController:nextInterface animated:YES completion:^{
                        
                        completion();
                    }];
                }else{
                    
                    NSAssert(0, @"buildName 不正确");
                }
                
            }else{
                
                NSAssert(0, @"buildName 不正确");
            }
        }
        
    }else{
        
        NSAssert(0, @"thisInterface不存在 或者 buildName不存在");
    }
}

@end
