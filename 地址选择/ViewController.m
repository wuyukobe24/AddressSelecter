//
//  ViewController.m
//  地址选择
//
//  Created by WangXueqi on 17/8/16.
//  Copyright © 2017年 JingBei. All rights reserved.
//

#import "ViewController.h"
#import "ChooseLocationView.h"
#import "CitiesDataTool.h"
@interface ViewController ()

@property (nonatomic,strong) UIButton *coverView;
@property (nonatomic,strong) ChooseLocationView *chooseLocationView;
@property (nonatomic,strong) UILabel *addresslabel;
@property (nonatomic,strong) UIButton * chooseButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.addresslabel.text = @"待选";
    [self.view addSubview:self.chooseButton];
//    [self.view addSubview:self.addresslabel];
    [[CitiesDataTool sharedManager] requestGetData];
}

- (UIButton *)chooseButton {

    if (!_chooseButton) {
        _chooseButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_chooseButton setFrame:CGRectMake(0, 100, self.view.frame.size.width, 30)];
        [_chooseButton setBackgroundColor:[UIColor orangeColor]];
        [_chooseButton setTitle:@"点击选择地区" forState:UIControlStateNormal];
        [_chooseButton addTarget:self action:@selector(chooseLocation:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _chooseButton;
}

- (UILabel *)addresslabel {

    if (!_addresslabel) {
        _addresslabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 30)];
        _addresslabel.backgroundColor = [UIColor orangeColor];
        _addresslabel.textAlignment = NSTextAlignmentCenter;
    }
    return _addresslabel;
}

-(void)lefttttt{
    __weak typeof(self) weakself = self;
    [UIView animateWithDuration:0.25 animations:^{
        [weakself.coverView removeFromSuperview];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.25 animations:^{
            
            UIWindow *window = [UIApplication sharedApplication].keyWindow;
            window.transform = CGAffineTransformIdentity;
            weakself.coverView.transform = CGAffineTransformIdentity;
        }];
    }];
}


- (void)chooseLocation:(UIButton *)sender {
    __weak typeof(self) weakself = self;
    [UIView animateWithDuration:0.25 animations:^{
        
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        window.transform = CGAffineTransformMakeScale(0.9, 0.9);
    } completion:^(BOOL finished) {
        
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        weakself.coverView.transform = CGAffineTransformMakeScale(1.13, 1.13);
        [window addSubview:weakself.coverView];
        
        weakself.chooseLocationView.chooseFinish = ^(NSString *name, NSString *areaId){
            [weakself.chooseButton setTitle:name forState:UIControlStateNormal];
            
            [UIView animateWithDuration:0.25 animations:^{
                [weakself.coverView removeFromSuperview];
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.25 animations:^{
                    
                    UIWindow *window = [UIApplication sharedApplication].keyWindow;
                    window.transform = CGAffineTransformIdentity;
                    weakself.coverView.transform = CGAffineTransformIdentity;
                }];
            }];
        };
    }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.chooseLocationView];
    if (!CGRectContainsPoint(self.chooseLocationView.frame, point)){
        __weak typeof(self) weakself = self;
        
        [UIView animateWithDuration:0.25 animations:^{
            [weakself.coverView removeFromSuperview];
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.25 animations:^{
                UIWindow *window = [UIApplication sharedApplication].keyWindow;
                window.transform = CGAffineTransformIdentity;
                weakself.coverView.transform = CGAffineTransformIdentity;
            }];
        }];
    }
}

//
- (UIButton *)coverView{
    
    if (!_coverView) {
        _coverView = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        _coverView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.4];
        _coverView.userInteractionEnabled = YES;
        [_coverView addTarget:self action:@selector(lefttttt) forControlEvents:UIControlEventTouchUpInside];
        
        _chooseLocationView = [[ChooseLocationView alloc]initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 350, [UIScreen mainScreen].bounds.size.width, 350) withTitlte:@"选择地区"];
        [_coverView addSubview:_chooseLocationView];
    }
    return _coverView;
}


@end
