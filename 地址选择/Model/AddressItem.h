//
//  AddressItem.h
//  地址选择
//
//  Created by WangXueqi on 17/8/16.
//  Copyright © 2017年 JingBei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddressItem : NSObject

@property (nonatomic,copy) NSString * code;
@property (nonatomic,copy) NSString * sheng;
@property (nonatomic,copy) NSString * di;
@property (nonatomic,copy) NSString * xian;
@property (nonatomic,copy) NSString * name;
@property (nonatomic,copy) NSString * level;
@property (nonatomic,assign) BOOL  isSelected;
- (instancetype)initWithDict:(NSDictionary *)dict;

@end
