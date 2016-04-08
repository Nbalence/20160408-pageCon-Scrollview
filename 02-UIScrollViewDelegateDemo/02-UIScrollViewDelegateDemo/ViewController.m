//
//  ViewController.m
//  02-UIScrollViewDelegateDemo
//
//  Created by qingyun on 16/4/8.
//  Copyright © 2016年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property(nonatomic, strong) UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建并添加scrollView
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(100, 200, 200, 300)];
    [self.view addSubview:scrollView];
    
    scrollView.backgroundColor = [UIColor redColor];
    //设置内容视图的大小
    scrollView.contentSize = CGSizeMake(375, 667);
    //设置内容视图
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 375, 667)];
    imageView.image = [UIImage imageNamed:@"new_feature_1"];
    [scrollView addSubview:imageView];
    
    _imageView = imageView;
    //设置代理
    scrollView.delegate = self;
    
    
    //[self performSelector:@selector(changeScrollViewContentOffSet:) withObject:scrollView afterDelay:3];
    
    
    //设置缩放内容视图的缩放比例范围
    scrollView.minimumZoomScale = 0.5;
    scrollView.maximumZoomScale = 1.5;
    //当缩放比例超出范围之后，是否有反弹效果（no:不会超出范围，yes:超出范围之后反弹）
    scrollView.bouncesZoom = YES;
    
    //属性设置滚动至顶部
    //scrollView.scrollsToTop = YES;
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)changeScrollViewContentOffSet:(UIScrollView *)scrollView{
    [scrollView setContentOffset:CGPointMake(0, 300) animated:YES];
}


#if 0
#pragma mark -UIScrollViewDelegate 滚动
//当scrollView滚动的时候，不停调用（可以监听scrollView的contentOffset）
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //NSLog(@"%@",NSStringFromCGPoint(scrollView.contentOffset));
    //NSLog(@"decelerating：%d",scrollView.decelerating);
    //NSLog(@"dragging：%d",scrollView.dragging);
    //NSLog(@"tracking:%d",scrollView.tracking);
    NSLog(@"%s",__func__);
}


//开始拖动的时候调用
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //NSLog(@"tracking:%d",scrollView.tracking);
    NSLog(@"%s",__func__);
}

// called on finger up if the user dragged. velocity is in points/millisecond. targetContentOffset may be changed to adjust where the scroll view comes to rest
//将要结束拖动
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
//    NSLog(@"velocity:%@",NSStringFromCGPoint(velocity));
//    NSLog(@"targetContentOffset:%@",NSStringFromCGPoint(*targetContentOffset));
    //强制设置scrollView的偏移量
    //*targetContentOffset = CGPointMake(0, 200);
    NSLog(@"%s",__func__);
}

// 已经结束拖动
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    //NSLog(@"dragging：%d",scrollView.dragging);
    NSLog(@"%s",__func__);
}

//将要开始减速
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    //NSLog(@"decelerating：%d",scrollView.decelerating);
    NSLog(@"%s",__func__);
}

//减速完成（停止）
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    //NSLog(@"contentOffset:%@",NSStringFromCGPoint(scrollView.contentOffset));
    NSLog(@"%s",__func__);
}

// called when setContentOffset/scrollRectVisible:animated: finishes. not called if not animating
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    NSLog(@"%s",__func__);
}
#endif
#pragma mark -UIScrollViewDelegate(缩放)
//指定缩放视图
- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    NSLog(@"%s,zooming:%d",__func__,scrollView.zooming);
    return _imageView;
}
//缩放之前调用
- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view {
    NSLog(@"%s,zooming:%d",__func__,scrollView.zooming);
}
//完成缩放
- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(nullable UIView *)view atScale:(CGFloat)scale{
    NSLog(@"%s,zooming:%d",__func__,scrollView.zooming);
}
//缩放时调用
- (void)scrollViewDidZoom:(UIScrollView *)scrollView{
    NSLog(@"%s,zooming:%d",__func__,scrollView.zooming);
}

#pragma mark -UIScrollViewDelegate(滚动至顶部)
//允许滚动至顶部
- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView{
    return YES;
}

//已经滚动至顶部
- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView{
    NSLog(@"加载新数据，刷新界面");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
