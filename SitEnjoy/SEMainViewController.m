//
//  SEMainViewController.m
//  SitEnjoy
//
//  Created by wupei on 2017/5/31.
//  Copyright © 2017年 WP. All rights reserved.
//

#import "SEMainViewController.h"
#import "BottomView.h"
#import <YYKit.h>
#import <SDCycleScrollView.h>
#import "SEMusicViewController.h"
#import "MusicListViewController.h"
#import "SEDiaryListViewController.h"

#import "UIConstant.h"

@interface SEMainViewController ()<BottomViewDelegate,SDCycleScrollViewDelegate>

//@property (strong, nonatomic) IBOutlet UIView *view;

@property (nonatomic, strong) BottomView *bottomView;

@end

@implementation SEMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"坐享其成";
//    self.navigationItem.title.
//    NSDictionary *textAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
//                                    [UIColor whiteColor],NSForegroundColorAttributeName,
//                                    [UIColor whiteColor],NSBackgroundColorAttributeName,nil];
//    
//    self.navigationController.navigationBar.titleTextAttributes = textAttributes;

    NSDictionary *textAtttibutes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName,[UIColor redColor],NSBackgroundColorAttributeName, nil];
    self.navigationController.navigationBar.titleTextAttributes = textAtttibutes;

    
    //    self.title = @"Title of the Page";
    
    [self addContentView];
    // Do any additional setup after loading the view from its nib.
    
    
    
    for (NSString *fontfamilyname in [UIFont familyNames]) {
        NSLog(@"family:''%@", fontfamilyname);
        for (NSString *fontname in [UIFont fontNamesForFamilyName:fontfamilyname]) {
            NSLog(@"\tfont:''%@",fontname);
            
        }
        
        NSLog(@"-----------");
    }
    
    
}

- (void)addContentView {
    self.bottomView = (BottomView *)[[NSBundle mainBundle] loadNibNamed:@"BottomView" owner:nil options:nil].lastObject;
    
    self.bottomView.frame = CGRectMake(0,kScreenHeight- 100, kScreenWidth, 100);
    self.bottomView.delegate = self;
    
    // 本地加载图片的轮播器
    NSMutableArray *picArr = [[NSMutableArray alloc] init];
    
    [picArr addObject:[UIImage imageNamed:@"Stream.gif"]];
    [picArr addObject:[UIImage imageNamed:@"cloud.gif"]];
    [picArr addObject:[UIImage imageNamed:@"Nature.gif"]];

    // 状态栏(statusbar)
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    NSLog(@"status width - %f", rectStatus.size.width); // 宽度
    NSLog(@"status height - %f", rectStatus.size.height);   // 高度
    
    
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) shouldInfiniteLoop:YES imageNamesGroup:picArr];
    [cycleScrollView setShowPageControl:NO];
    [cycleScrollView setAutoScroll:NO];
    cycleScrollView.delegate = self;
    //解决上部分
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self.view addSubview:cycleScrollView];
    [self.view addSubview:self.bottomView];
    
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, kScreenWidth, 50)];
    lab.text = @"我是新字体";
    lab.textColor = [UIColor redColor];
    lab.font = [UIFont fontWithName:@"DFWaWaSC-W5" size:17];
    
    [self.view addSubview:lab];
    
    //状态栏
    

    
    
}


//进入时隐藏
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //隐藏=YES,显示=NO; Animation:动画效果
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    
}
//退出时显示
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    //隐藏=YES,显示=NO; Animation:动画效果
//    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
    
}

- (BOOL)prefersStatusBarHidden  {
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 

/** 图片滚动回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index {
    NSLog(@"第%ld个",index);
}

#pragma mark - BottomViewDelegate

- (void)meBtnClick {
    
    
    NSLog(@"点击了我");
    // 日记列表。
    
    
    SEDiaryListViewController *diaryListVc = [[SEDiaryListViewController alloc] init];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:diaryListVc];
    
    [self presentViewController:nav animated:YES completion:nil];
    
    
}

- (void)metitationBtnClick {
    NSLog(@"点击冥想");
//    MusicListViewController *musicListVC = [[MusicListViewController alloc] init];
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:musicListVC];
//    [self presentViewController:nav animated:YES
//                     completion:nil];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MusicList" bundle:nil];
    
    MusicListViewController *musicListVC = [storyboard instantiateViewControllerWithIdentifier:@"musicList"];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:musicListVC];
    
    [self presentViewController:nav animated:YES completion:nil];
    
   }

- (void)timerBtnClick {
    NSLog(@"点击了定时器");
}

@end
