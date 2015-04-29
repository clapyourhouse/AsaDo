//
//  ADTopViewController.m
//  AsaDokei
//
//  Created by 北村 彰悟 on 2015/04/26.
//  Copyright (c) 2015年 北村 彰悟. All rights reserved.
//

//まだはっきり見えてないTODO
//60秒で動くやつ。
//音量調整
//再生中の曲名を取得
//アラーム鳴動
//スヌーズ
//繰り返し機能
//天気API、無料分ではキツいかもしれない。無料分は1200 calls / month　参照:http://openweathermap.org/price
//アラーム系はこれを一度作って、理解を深める必要があるかも。参照:http://lab.dolice.net/blog/2013/09/04/download-xcode-objc-alarm/

//TODO:
//広告どうする？
//cellにSlider表示
//customCellにする
//シェア機能
//サポート画面

#import "ADTopViewController.h"

@interface ADTopViewController ()
@property MPMusicPlayerController* player;

@end

@implementation ADTopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self minuteMove];
    
    self.player = [MPMusicPlayerController applicationMusicPlayer];
    
    _volumeView.backgroundColor = [UIColor clearColor];
    MPVolumeView *myVolumeView =
    [[MPVolumeView alloc] initWithFrame: _volumeView.bounds];
    [_volumeView addSubview: myVolumeView];
    self.navigationItem.title = @"トップ";
    [NSTimer scheduledTimerWithTimeInterval:1.0f
                                     target:self
                                   selector:@selector(currentTime)
                                   userInfo:nil
                                    repeats:true];
    // Do any additional setup after loading the view from its nib.
}
- (void)minuteMove{
}

- (void)currentTime{
    NSDate *date = [NSDate date];
    
    [self currentWeek:date];    
    [self currentDay:date];
    //日付時刻のフォーマットを取得
    fotmat = [[NSDateFormatter alloc]init];
    [fotmat setDateFormat:@"HH:mm:ss"];
    [fotmat setTimeZone:[NSTimeZone defaultTimeZone]];
    
    _timeLabl.text = [NSString stringWithFormat:@"%@",[fotmat stringFromDate:date]];
}

- (void)currentWeek:(NSDate*)date{
    //曜日を取得
    NSCalendar* calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents* comps = [calendar components:NSWeekdayCalendarUnit
                                          fromDate:date];
    NSDateFormatter* df = [[NSDateFormatter alloc] init];
    df.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ja"];
    
    //comps.weekdayは 1-7の値が取得できるので-1する
    NSString* weekDayStr = df.shortWeekdaySymbols[comps.weekday-1];
    _weekLabl.text = [NSString stringWithFormat:@"(%@)",weekDayStr];

}
- (void)currentDay:(NSDate*)date{
    fotmat = [[NSDateFormatter alloc]init];
    [fotmat setDateFormat:@"yyyy/MM/dd"];
    [fotmat setTimeZone:[NSTimeZone defaultTimeZone]];
    _dayLabl.text = [NSString stringWithFormat:@"%@",[fotmat stringFromDate:date]];
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

- (IBAction)musicBtn:(id)sender {
    MPMediaPickerController *picker = [[MPMediaPickerController alloc]init];
    picker.delegate = self;
    //複数選択を不可にする
    picker.allowsPickingMultipleItems = NO;
    [self presentViewController:picker animated:YES completion:nil];
}

- (void)mediaPicker:(MPMediaPickerController *)mediaPicker didPickMediaItems:(MPMediaItemCollection *)mediaItemCollection{
    
    [self.player setQueueWithItemCollection:mediaItemCollection];
    [self.player play];
    [mediaPicker dismissViewControllerAnimated:YES completion:nil];
}

- (void)mediaPickerDidCancel:(MPMediaPickerController *)mediaPicker{
    [mediaPicker dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)vibeBtn:(id)sender {
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

- (IBAction)alermBtn:(id)sender {
}
@end
