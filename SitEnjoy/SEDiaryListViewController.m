//
//  SEDiaryListViewController.m
//  SitEnjoy
//
//  Created by wupei on 28/6/17.
//  Copyright © 2017年 WP. All rights reserved.
//

#import "SEDiaryListViewController.h"
#import <Masonry.h>
#import <MJRefresh.h>
#import <YYKit.h>
#import "SEDiaryListTableViewCell.h"
#import "SEDiaryListHeader.h"
#import "UIBarButtonItem+XMGExtension.h"
#import "SEWriteDiaryViewController.h"


/*** 颜色 ***/
#define XMGColorA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]
#define XMGColor(r, g, b) XMGColorA((r), (g), (b), 255)
#define XMGRandomColor XMGColor(arc4random_uniform(255), arc4random_uniform(255), arc4random_uniform(255))
#define XMGrayColor(v) XMGColor((v), (v), (v))
#define XMGCommonBgColor XMGrayColor(206)
#define XMGCommonBgColor XMGrayColor(206)

@interface SEDiaryListViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;// 列表

@end

@implementation SEDiaryListViewController

static NSString * const DiaryCellId = @"diaryCell";
static NSString * const DiaryHeaderCellId = @"diaryHeader";



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
    
    [self setupTable];
    
    [self setupRefresh];
    
    [self setupNav];
   
}

- (void)setupNav {
    
    // 左边
    self.navigationItem.title = @"坐享日记";
    //    self.navigationItem.titleView
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"Btn_Back_34x34_" highImage:@"Btn_Back_34x34_" target:self action:@selector(goback)];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"Btn_AddNew_34x34_" highImage:@"Btn_AddNew_34x34_" target:self action:@selector(goToWrite)];
    
    
}

- (void)goback {
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"返回主页");
    }];
}

- (void)goToWrite {
    
    SEWriteDiaryViewController *wrirteVc = [[SEWriteDiaryViewController alloc] init];
    
    [self.navigationController pushViewController:wrirteVc animated:YES];
}

- (void)setupTable {
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SEDiaryListTableViewCell class])bundle:nil] forCellReuseIdentifier:DiaryCellId];
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SEDiaryListHeader class]) bundle:nil] forHeaderFooterViewReuseIdentifier:DiaryHeaderCellId];
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    // 设置默认的 分块的高度
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = 0;
}

- (void)setupRefresh
{
    // self.tableView.mj_footer.automaticallyHidden = NO;
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        NSLog(@"下拉");

    }];
    
//    [self.tableView.mj_header beginRefreshing];
    
    self.tableView.mj_footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
        NSLog(@"上拉");
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma - mark loaddata 



#pragma - mark UITableView Header 

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 22;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    SEDiaryListHeader  *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:DiaryHeaderCellId];

    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 63.5;
}

# pragma - mark UITableView dateSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

# pragma - mark UITableView delegate 

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString *ID = @"diaryListCell";
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
//    if (!cell) {
//        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
//    }
//    
//    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
//    
//    cell.textLabel.textAlignment = NSTextAlignmentCenter;
//    return cell;
    
    SEDiaryListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:DiaryCellId];
    
    // 此处， 需要给cell 传数据。
    
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  //查看日记。
    
    
}

# pragma - mark lazy load

- (UITableView *)tableView {
    if (nil == _tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        _tableView.backgroundColor = XMGCommonBgColor;
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

@end
