//
//  ChooseLocationView.h
//  地址选择
//
//  Created by WangXueqi on 17/8/16.
//  Copyright © 2017年 JingBei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChooseLocationView : UIView
- (instancetype)initWithFrame:(CGRect)frame withTitlte:(NSString *)title;

@property (nonatomic, copy) void(^chooseFinish)(NSString *adress, NSString *areaId);
@end
