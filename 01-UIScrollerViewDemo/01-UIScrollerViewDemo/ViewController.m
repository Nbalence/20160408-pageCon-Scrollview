//
//  ViewController.m
//  01-UIScrollerViewDemo
//
//  Created by qingyun on 16/4/8.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _scrollView.backgroundColor = [UIColor redColor];
    //设置contentSize（必须设置）
    _scrollView.contentSize = CGSizeMake(400, 667);
    //偏移量
    _scrollView.contentOffset = CGPointMake(100, 0);
    //contentInset(在原有的基础上调整内容滚动区域的大小)
    //_scrollView.contentInset = UIEdgeInsetsMake(-100, 0, 0, 0);
    
    //锁定方向(当系统识别滚动方向的时候，会把另外一个方向锁定，如果识别不了，就不锁定方向)
    _scrollView.directionalLockEnabled = YES;
    //反弹效果(默认为yes)
    _scrollView.bounces = YES;
    //默认是no，假如是yes并且bounces是yes,甚至如果内容大小小于bounds的时候，允许垂直拖动
    _scrollView.alwaysBounceVertical = YES;
    //分页（默认no）
    _scrollView.pagingEnabled = YES;
    //滚动(默认yes允许滚动)
    _scrollView.scrollEnabled = YES;
    
    //滚动条
    //showsHorizontalScrollIndicator默认yes 显示
    _scrollView.showsHorizontalScrollIndicator = NO;
    //滚动条滚动的范围(垂直滚动条滚动范围上下各缩小50)
    _scrollView.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 50, 0);
    //样式
    _scrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
;