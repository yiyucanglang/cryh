//
//  ViewController.m
//  cryh
//
//  Created by Junze on 16/5/6.
//  Copyright © 2016年 Zhouyijin. All rights reserved.
//

#import "ViewController.h"
#import "NSDate+convenience.h"
#import "AFNetworking.h"
#import "ThirdViewController.h"
typedef void (^testBlock)(void);
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *timeLB;
@property (copy) testBlock testblock;
@end

@implementation ViewController

- (void)viewDidLoad {
//    self.title = @"笑傲江湖";
    [super viewDidLoad];
    _timeLB.text = [self stringFromDate:[NSDate date]];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
    [self initUI];
}


- (void)initUI
{
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(pushController)];
    UIButton *right = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
//    right.backgroundColor = [UIColor yellowColor];
    [right setTitle:@"跳转" forState:UIControlStateNormal];
    [right addTarget:self action:@selector(pushController) forControlEvents:UIControlEventTouchUpInside];
    [right setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    UIBarButtonItem *rightbar = [[UIBarButtonItem alloc] initWithCustomView:right];
    self.navigationItem.rightBarButtonItem = rightbar;

}

- (void)pushController
{
    
    ThirdViewController *third = [[ThirdViewController alloc] initWithNibName:@"ThirdViewController" bundle:nil];
    third.title = @"针毡天下";
    third.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:third animated:YES];
}

- (void)updateTime
{
  _timeLB.text = [self stringFromDate:[NSDate date]];
    
}


- (void)postNoti:(NSDate *)date
{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSInteger seconds = [calendar component:NSCalendarUnitSecond fromDate:date];
    if (seconds%30 == 0)
    {
        UILocalNotification *local = [[UILocalNotification alloc] init];
        local.fireDate = [NSDate dateWithTimeInterval:5 sinceDate:[NSDate date]];
        local.timeZone = [NSTimeZone localTimeZone];
        local.alertTitle = @"ssssss";
        local.alertBody = @"11111111";
        local.repeatInterval = 0;
        [[UIApplication sharedApplication] scheduleLocalNotification:local];
    }

}

- (NSString *)stringFromDate:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat: @"yyyy-MM-dd hh:mm:s"];
    NSString *str = [formatter stringFromDate:date];
    return str;
}

- (NSDate *)dateFromStr:(NSString *)str
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy年MM月dd日 hh:mm:ss"];
    return [formatter dateFromString:str];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
