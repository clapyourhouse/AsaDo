//
//  ADTopViewController.m
//  AsaDokei
//
//  Created by 北村 彰悟 on 2015/04/26.
//  Copyright (c) 2015年 北村 彰悟. All rights reserved.
//

#import "ADTopViewController.h"
#import "ADSettingTableViewController.h"

@interface ADTopViewController ()

@end

@implementation ADTopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"トップ";

    // Do any additional setup after loading the view from its nib.
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

- (IBAction)settingBtn:(id)sender {
    ADSettingTableViewController *adsettingView = [[ADSettingTableViewController alloc]init];
    [self.navigationController pushViewController:adsettingView animated:YES];
}
@end
