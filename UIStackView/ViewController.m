//
//  ViewController.m
//  autolayout
//
//  Created by 张天龙 on 2022/12/10.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) UIStackView *HStack;
@property (nonatomic,strong) UIView *redView;
@property (nonatomic,strong) UIView *blueView;
@property (nonatomic,strong) UIView *yellowView;
@end

@implementation ViewController


- (UIView *)yellowView{
    if (_yellowView == nil) {
        _yellowView = [[UIView alloc] init];
        _yellowView.backgroundColor = [UIColor yellowColor];
    }
    return _yellowView;
}

- (UIView *)redView{
    if (_redView == nil) {
        _redView = [[UIView alloc] init];
        _redView.backgroundColor = [UIColor redColor];
    }
    return _redView;
}

- (UIView *)blueView{
    if (_blueView == nil) {
        _blueView = [[UIView alloc] init];
        _blueView.backgroundColor = [UIColor blueColor];
    }
    return _blueView;
}

- (UIStackView *)HStack{
    if (_HStack == nil) {
        _HStack = [[UIStackView alloc] init];
        _HStack.backgroundColor = [UIColor grayColor];
        _HStack.axis = UILayoutConstraintAxisHorizontal;
        /**
         UIStackViewDistributionFill: 轴方向填充，根据优先级拉伸某个视图，相同优先级也拉神某个视图，固定宽/高情况下，那个长拉伸哪个
         UIStackViewDistributionFillEqually： 轴方向等宽（水平）登高（垂直）
         UIStackViewDistributionFillProportionally：按照比例拉伸（前提是设置动态宽（水平）高（垂直）constraintGreaterThanOrEqualToConstant）
         UIStackViewDistributionEqualSpacing：相等距离
         UIStackViewDistributionEqualCentering：中心距离相等
         */
        _HStack.distribution = UIStackViewDistributionFillProportionally;
        /**
         UIStackViewAlignmentFill,    // 子视图填充
         UIStackViewAlignmentLeading,    // 子视图左对齐（axis为垂直方向而言）
         UIStackViewAlignmentTop = UIStackViewAlignmentLeading,    // 子视图顶部对齐（axis为水平方向而言）
         UIStackViewAlignmentFirstBaseline,    // 按照第一个子视图的文字的第一行对齐，同时保证高度最大的子视图底部对齐（只在axis为水平方向有效）
         UIStackViewAlignmentCenter,    // 子视图居中对齐
         UIStackViewAlignmentTrailing,    // 子视图右对齐(axis为垂直方向而言）
         UIStackViewAlignmentBottom = UIStackViewAlignmentTrailing,    // 子视图底部对齐（axis为水平方向而言）
         UIStackViewAlignmentLastBaseline,    // 按照最后一个子视图的文字的最后一行对齐，同时保证高度最大的子视图顶部对齐（只在axis为水平方向有效）
         */
        _HStack.alignment =  UIStackViewAlignmentCenter;
        /**
         在distribution前三个属性值(UIStackViewDistributionFill/UIStackViewDistributionFillEqually/UIStackViewDistributionFillProportionally)设置的情况下，子视图之间是没有间隔，我们可以通过spacing属性显式的设置
         */
//        _HStack.spacing = 20;
        _HStack.translatesAutoresizingMaskIntoConstraints = NO;
    }
    return _HStack;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**
     参考博客 https://blog.csdn.net/songzhuo1991/article/details/115626992
     
     */
    
    [self.view addSubview:self.HStack];
   
    [NSLayoutConstraint activateConstraints:@[
        [self.HStack.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor constant:-20],
        [self.HStack.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:20],
        [self.HStack.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-20],
//        [self.HStack.widthAnchor constraintEqualToConstant:200]
//        [self.HStack.heightAnchor constraintEqualToConstant:200]
    ]];
    [self.HStack addArrangedSubview:self.blueView];
    [NSLayoutConstraint activateConstraints:@[
        [self.blueView.widthAnchor constraintGreaterThanOrEqualToConstant:40.0],
        [self.blueView.heightAnchor constraintEqualToConstant:100.0]
    ]];
    [self.HStack addArrangedSubview:self.redView];

    
    [NSLayoutConstraint activateConstraints:@[
        [self.redView.widthAnchor constraintGreaterThanOrEqualToConstant:120.0],
        [self.redView.heightAnchor constraintEqualToConstant:60.0]
    ]];
    [self.HStack addArrangedSubview:self.yellowView];
   
    [NSLayoutConstraint activateConstraints:@[
        [self.yellowView.widthAnchor constraintGreaterThanOrEqualToConstant:80.0],
        [self.yellowView.heightAnchor constraintEqualToConstant:80.0]
    ]];
   
}


@end
