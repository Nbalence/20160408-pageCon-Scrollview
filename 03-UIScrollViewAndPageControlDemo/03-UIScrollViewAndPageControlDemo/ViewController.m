//
//  ViewController.m
//  03-UIScrollViewAndPageControlDemo
//
//  Created by qingyun on 16/4/8.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置scrollView的contentSize
    _scrollView.contentSize = CGSizeMake(375 * 3, 667);
    
    //设置代理
    _scrollView.delegate = self;
    //设置分页
    _scrollView.pagingEnabled = YES;
    
    
    //创建点击手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleClick:)];
    //设置有效点击数
    tap.numberOfTapsRequired = 2;
    [_scrollView addGestureRecognizer:tap];
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)doubleClick:(UITapGestureRecognizer *)tap {
    NSLog(@"%s",__func__);
}

#pragma mark  -UIScrollViewDelegate
//滚动停止的时候更新当前页码
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
   //计算当前页码
    NSInteger currentPage = scrollView.contentOffset.x / 375;
    
    _pageControl.currentPage = currentPage;
}

- (IBAction)pageControlValueChanged:(UIPageControl *)sender {
    //计算scrollView的偏移量
    CGPoint point = CGPointMake(sender.currentPage * 375, 0);
    [_scrollView setContentOffset:point animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
