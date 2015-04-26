//
//  AppDelegate.h
//  AsaDokei
//
//  Created by 北村 彰悟 on 2015/04/26.
//  Copyright (c) 2015年 北村 彰悟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADTopViewController.h"
@class ViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    ADTopViewController *topViewController;
}

@property (strong, nonatomic) UIWindow *window;


@end

