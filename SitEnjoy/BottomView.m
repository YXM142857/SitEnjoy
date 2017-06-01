//
//  BottomView.m
//  SitEnjoy
//
//  Created by wupei on 2017/5/31.
//  Copyright © 2017年 WP. All rights reserved.
//

#import "BottomView.h"

@interface BottomView ()

@property (weak, nonatomic) IBOutlet UIButton *meBtn;

@property (weak, nonatomic) IBOutlet UIButton *metitationBtn;

@property (weak, nonatomic) IBOutlet UIButton *timerBtn;


@end

@implementation BottomView

- (IBAction)meBtnClick:(id)sender {
    if ([self.delegate respondsToSelector:@selector(meBtnClick)]) {
        [self.delegate meBtnClick];
    }
    
}

- (IBAction)metitationBtnClick:(id)sender {
    if ([self.delegate respondsToSelector:@selector(metitationBtnClick)]) {
        [self.delegate metitationBtnClick];
    }
}

- (IBAction)timerBtnClick:(id)sender {
    if ([self.delegate respondsToSelector:@selector(timerBtnClick)]) {
        [self.delegate timerBtnClick];
    }
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
