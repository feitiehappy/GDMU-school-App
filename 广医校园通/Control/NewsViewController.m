//
//  NewsViewController.m
//  广医校园通
//
//  Created by 十大大 on 16/6/1.
//  Copyright © 2016年 Y. All rights reserved.
//

#import "NewsViewController.h"

@interface NewsViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UINavigationItem *navbar;


@property (weak, nonatomic) IBOutlet UIScrollView *ScrollViewHorizenal;//水平的
@property (weak, nonatomic) IBOutlet UIScrollView *ScrollViewVertial;
@property (weak, nonatomic) IBOutlet UIPageControl *PageControl;
@property (strong,nonatomic)NSTimer *time;
@property (nonatomic,weak) NSArray *picture;
@end

@implementation NewsViewController
-(NSArray*)picture
{
    NSArray *array=@[@"IMG_6359",@"IMG_6360",@"IMG_6361",@"IMG_6362",@"IMG_6364"];
    _picture= array;
    return _picture;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offSetX=scrollView.contentOffset.x;
    offSetX=offSetX+(self.ScrollViewHorizenal.frame.size.width*0.5);
    int page=offSetX/self.ScrollViewHorizenal.frame.size.width;
    self.PageControl.currentPage=page;
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.time invalidate];
    self.time=nil;
}
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    self.time=[NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(scoll) userInfo:nil repeats:YES];
    NSRunLoop *loop=[NSRunLoop currentRunLoop];
    [loop addTimer:self.time forMode:NSRunLoopCommonModes];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden=YES;
//    NSLog(@"hisfhi");
    CGFloat weight=self.ScrollViewHorizenal.frame.size.width;
    CGFloat height=self.ScrollViewHorizenal.frame.size.height;
    CGFloat Y=self.ScrollViewHorizenal.frame.origin.y;
    
    for (int i=0; i<5; i++) {
        UIImageView *btn=[[UIImageView alloc]init];
        CGFloat X=i*weight;
        btn.frame=CGRectMake(X, Y, weight, height);
        btn.image=[UIImage imageNamed:self.picture[i]];
        
        [self.ScrollViewHorizenal addSubview:btn];
        
    }
    CGFloat TotalWeight=5*weight;
    self.ScrollViewHorizenal.contentSize=CGSizeMake(TotalWeight, 0);
    self.ScrollViewHorizenal.pagingEnabled=YES;
    self.ScrollViewHorizenal.showsHorizontalScrollIndicator=NO;
    self.PageControl.numberOfPages=5;
    self.PageControl.currentPage=0;
    self.time=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(scoll) userInfo:nil repeats:YES];
    NSRunLoop *loop=[NSRunLoop currentRunLoop];
    [loop addTimer:self.time forMode:NSRunLoopCommonModes];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)scoll
{
    NSLog(@"101");
    NSInteger pages=self.PageControl.currentPage;
    if (pages==self.PageControl.numberOfPages-1) {
        pages=0;
    }
    else{
        pages++;
    }
    CGFloat offsetX=pages*self.ScrollViewHorizenal.frame.size.width;
    [self.ScrollViewHorizenal setContentOffset:CGPointMake(offsetX, 0) animated:YES];
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
