//
//  ViewController.m
//  01-UIPageControlDemo
//
//  Created by qingyun on 16/4/8.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建并添加pageControl
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(100, 100, 200, 40)];
    [self.view addSubview:pageControl];
    pageControl.backgroundColor = [UIColor lightGrayColor];
    
    //设置总页码
    pageControl.numberOfPages = 11;
    
    //当前页
    pageControl.currentPage = 5;
    
    //着色
    pageControl.pageIndicatorTintColor = [UIColor redColor];
    //当前页着色
    pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
    
    //延迟更新显示页码(配合使用updateCurrentPageDisplay)
    pageControl.defersCurrentPageDisplay = YES;
    
    //添加事件监听（valueChanged）
    [pageControl addTarget:self action:@selector(pageControlValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    // Do any additional setup after loading the view, typically from a nib.
    
}
-(void)pageControlValueChanged:(UIPageControl *)pageControl {
    //延迟更新显示页码
    [pageControl performSelector:@selector(updateCurrentPageDisplay) withObject:nil afterDelay:1];
    
    NSLog(@"当前页码:%ld",pageControl.currentPage);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
