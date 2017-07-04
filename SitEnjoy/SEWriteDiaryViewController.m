//
//  SEWriteDiaryViewController.m
//  SitEnjoy
//
//  Created by wupei on 29/6/17.
//  Copyright © 2017年 WP. All rights reserved.
//

#import "SEWriteDiaryViewController.h"
#import "UIBarButtonItem+XMGExtension.h"
#import <YYKit.h>

@interface SEWriteDiaryViewController ()<YYTextViewDelegate>

@property (nonatomic, strong) YYTextView *textView;//富文本编辑

@end

@implementation SEWriteDiaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setupNav];
    
    [self setEditerText];
}


- (void)setupNav {
    
    self.navigationItem.title = @"写日记";

    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"Btn_Back_34x34_" highImage:@"Btn_Back_34x34_" target:self action:@selector(goback)];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:@"Edit_FontType_18x18_" highImage:@"Edit_FontType_18x18_" target:self action:@selector(selectFont)];
    
    
}

- (void)setEditerText {
  
    [self.view addSubview:self.textView];
}

- (void)goback {
    [self.navigationController popViewControllerAnimated:YES];
}

//选择字体或者下载字体

- (void)selectFont {
    
    
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

- (YYTextView *)textView {
    if (nil == _textView) {
        _textView = [[YYTextView alloc] init];
        
        _textView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        
        _textView.placeholderFont = [UIFont systemFontOfSize:17];
        
        _textView.placeholderText = @"开始写作吧";
        _textView.delegate = self;
        
        [_textView resignFirstResponder];
    }
    
    return _textView;
}

@end
