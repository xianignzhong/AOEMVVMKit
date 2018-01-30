//
//  ThreeViewController.m
//  AOEMVVMSimple
//
//  Created by 夏宁忠 on 2018/1/23.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#import "ThreeViewController.h"
#import "ThreeViewModel.h"
#import "UIViewController+AMKLogic.h"

@interface ThreeViewController ()

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //注册ViewModel
    [self initializeViewModel:[ThreeViewModel class]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)dealloc{
    
    NSLog(@"Three ViewController dealloc");
}

@end
