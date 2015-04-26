//
//  ViewController.m
//  AsaDokei
//
//  Created by 北村 彰悟 on 2015/04/26.
//  Copyright (c) 2015年 北村 彰悟. All rights reserved.
//

#import "ViewController.h"
#import "ADSettingTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 生成
//    ViewController *viewcon = [[ViewController alloc]init];
//    UINavigationController *nav =
//    [[UINavigationController alloc] initWithRootViewController:viewcon];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)settingBtn:(id)sender {
    ADSettingTableViewController *adsettingView = [[ADSettingTableViewController alloc]init];
    [self.navigationController pushViewController:adsettingView animated:YES];

}
@end
