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

@interface SEMainViewController ()<BottomViewDelegate,SDCycleScrollViewDelegate>

//@property (strong, nonatomic) IBOutlet UIView *view;

@property (nonatomic, strong) BottomView *bottomView;

@end

@implementation SEMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"坐享其成";
    [self addContentView];
    // Do any additional setup after loading the view from its nib.
}

- (void)addContentView {
    self.bottomView = (BottomView *)[[NSBundle mainBundle] loadNibNamed:@"BottomView" owner:nil options:nil].lastObject;
    
    self.bottomView.frame = CGRectMake(0,kScreenHeight- 100, kScreenWidth, 100);
    self.bottomView.delegate = self;
    
    // 本地加载图片的轮播器
    NSMutableArray *picArr = [[NSMutableArray alloc] init];
    
    [picArr addObject:[UIImage imageNamed:@"Stream.gif"]];
    [picArr addObject:[UIImage imageNamed:@"Cloud.gif"]];
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
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
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
}

- (void)metitationBtnClick {
    NSLog(@"点击冥想");
}

- (void)timerBtnClick {
    NSLog(@"点击了定时器");
}

@end
