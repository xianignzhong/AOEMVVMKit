//
//  FirstViewController.m
//  AOEMVVMSimple
//
//  Created by 夏宁忠 on 2018/1/22.
//  Copyright © 2018年 夏宁忠. All rights reserved.
//

#import "FirstViewController.h"
#import "UIViewController+AMKLogic.h"
#import "FirstViewModel.h"

#import "FirstEventHandlerPort.h"

#import "ThreeViewController.h"

@interface FirstViewController ()

@property (weak, nonatomic) IBOutlet UIButton *btn;


@end

@implementation FirstViewController

-(void)viewWillAppear:(BOOL)animated{
    
    NSLog(@"logic === %@", self.logicHandler);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initializeViewModel:[FirstViewModel class]];
    
    id<FirstEventHandlerPort> port = AMKConvertViewModelToType(id<FirstEventHandlerPort>);
    
    AMK_C_(self.btn, port, btnCommand);
    
}
- (IBAction)click:(id)sender {
    
    ThreeViewController * vc = [[ThreeViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)viewDidAppear:(BOOL)animated{

    NSLog(@"viewDidAppear -- FirstVC");
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
