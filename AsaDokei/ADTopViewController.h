//
//  ADTopViewController.h
//  AsaDokei
//
//  Created by 北村 彰悟 on 2015/04/26.
//  Copyright (c) 2015年 北村 彰悟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADSettingTableViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <AudioToolbox/AudioToolbox.h>


@interface ADTopViewController : UIViewController<MPMediaPickerControllerDelegate>{
    NSDateFormatter *fotmat;

}
- (IBAction)settingBtn:(id)sender;
- (IBAction)musicBtn:(id)sender;
- (IBAction)vibeBtn:(id)sender;
- (IBAction)alermBtn:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *timeLabl;
@property (strong, nonatomic) IBOutlet UILabel *dayLabl;
@property (strong, nonatomic) IBOutlet UILabel *weekLabl;
@property (strong, nonatomic) IBOutlet UIView *volumeView;

@end
