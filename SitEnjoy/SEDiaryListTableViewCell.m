//
//  SEDiaryListTableViewCell.m
//  SitEnjoy
//
//  Created by wupei on 28/6/17.
//  Copyright © 2017年 WP. All rights reserved.
//

#import "SEDiaryListTableViewCell.h"

@implementation SEDiaryListTableViewCell



- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor clearColor];
    
    
    //整个 cell 设置圆角
    [self.layer setMasksToBounds:YES];
    self.layer.cornerRadius = 5;
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}


//此处修改frame ，实现 cell 之间的间距
//为了拦截所有设置 frame 的方法
- (void)setFrame:(CGRect)frame {
    
    //每个的cell 的高度减少 5
    frame.size.height -= 5;
    frame.origin.x += 5;
    frame.size.width -= 10;
    //改掉
    [super setFrame:frame];
}



@end
