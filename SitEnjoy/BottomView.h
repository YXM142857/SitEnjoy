//
//  BottomView.h
//  SitEnjoy
//
//  Created by wupei on 2017/5/31.
//  Copyright © 2017年 WP. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BottomViewDelegate <NSObject>

@optional
/** 我 */
- (void)meBtnClick;
/** 冥想 */
- (void)metitationBtnClick;
/** 定时 */
- (void)timerBtnClick;

@end

@interface BottomView : UIView

/** 代理对象 */
@property (nonatomic, weak) id delegate;

@end
