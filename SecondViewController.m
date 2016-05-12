//
//  SecondViewController.m
//  cryh
//
//  Created by Junze on 16/5/9.
//  Copyright © 2016年 Zhouyijin. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initUI];
}

- (void)initUI
{
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationItem.title = @"奇幻森林";
}

- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"view frame:%@",NSStringFromCGRect(self.view.frame));
    
    UILabel *la = [[UILabel alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-30, 100, 30)];
    la.backgroundColor = [UIColor redColor];
    [self.view addSubview:la];
    [self setNeedsStatusBarAppearanceUpdate];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
