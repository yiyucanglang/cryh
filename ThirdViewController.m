//
//  ThirdViewController.m
//  cryh
//
//  Created by Junze on 16/5/10.
//  Copyright © 2016年 Zhouyijin. All rights reserved.
//

#import "ThirdViewController.h"
#import "Person.h"
@interface ThirdViewController ()
@property (strong,nonatomic) Person *host;
@property (copy,nonatomic)NSString *name;
@property (weak, nonatomic) IBOutlet UITextField *testTF;
- (IBAction)changeValueBtnPressed:(UIButton *)sender;
@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
//     [self setNeedsStatusBarAppearanceUpdate];
//    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    [self testhost];
}

-(void)testhost
{
    _testTF.placeholder = @"122331231";
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick)];
    [self.view addGestureRecognizer:tap];
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:_testTF.placeholder];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, _testTF.placeholder.length)];
    [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:40] range:NSMakeRange(0, _testTF.placeholder.length)];
    _testTF.attributedPlaceholder = str;
    
    
    
    
    
    
    
//    self.host = [[Person alloc] init];
//    self.host.dog = [[Animal alloc] init];
//    [self.host ssss];
//    NSLog(@"host'age:%ld",[[self.host valueForKey:@"age"] integerValue]);
//    NSLog(@"host'dog.height:%ld",[[self.host valueForKeyPath:@"dog.height"] integerValue]);
//    [self.host setValue:[NSNumber numberWithInteger:20] forKeyPath:@"dog.height"];
//    
//    NSLog(@"host'dog.height:%ld",[[self.host valueForKeyPath:@"dog.height"] integerValue]);
    
//    [self addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
//    CGPoint range = CGPointMake(0, 29);
//    NSValue *value = [NSValue valueWithBytes:&range objCType:@encode(CGPoint)];
//    
//    CGPoint rang2;
//    [value  getValue:&rang2];
//    NSLog(@"%@",NSStringFromCGPoint(rang2));
    
}

- (void)tapClick
{
    [self.view resignFirstResponder];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
//    [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    NSLog(@"path:%@",keyPath);
    NSLog(@"change:%@",change);
    NSLog(@"object:%@",object);
    NSLog(@"context:%@",context);
    NSLog(@"ssdsss:%@",[change objectForKey:@"new"]);
    
}

- (void)viewWillAppear:(BOOL)animated
{
   
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)changeValueBtnPressed:(UIButton *)sender
{
    NSInteger value = arc4random()%100+1;
    _name = [NSString stringWithFormat:@"%ld",(long)value];

//    self.host.dog.height = value;
//    [self.host setValue:[NSNumber numberWithInteger:value] forKey:@"age"];
}

- (void)dealloc
{
//    [self.host removeObserver:self forKeyPath:@"dog.height" context:nil];
}
@end
