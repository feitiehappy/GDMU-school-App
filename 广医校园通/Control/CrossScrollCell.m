//
//  CrossScrollCell.m
//  广医校园通
//
//  Created by 十大大 on 16/7/11.
//  Copyright © 2016年 Y. All rights reserved.
//

#import "CrossScrollCell.h"
@interface CrossScrollCell()

@property (nonatomic,weak) NSArray *picture;
@property (weak, nonatomic) IBOutlet UIScrollView *ScrollViewHorizenal;
@property (weak, nonatomic) IBOutlet UIPageControl *PageContol;
@property (strong,nonatomic)NSTimer *time;
@end
@implementation CrossScrollCell

- (void)awakeFromNib {
    [super awakeFromNib];
    CGFloat weight=self.frame.size.width;
    CGFloat height=self.frame.size.height;
    //CGFloat X;
    CGFloat Y=0;
    
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
    self.PageContol.numberOfPages=5;
    self.PageContol.currentPage=0;
    self.time=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(scoll) userInfo:nil repeats:YES];
    NSRunLoop *loop=[NSRunLoop currentRunLoop];
    [loop addTimer:self.time forMode:NSRunLoopCommonModes];
    // Initialization code
}
-(NSArray*)picture
{
    NSArray *array=@[@"IMG_6359",@"IMG_6360",@"IMG_6361",@"IMG_6362",@"IMG_6364"];
    _picture= array;
    return _picture;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)scoll
{
    //    NSLog(@"101");
    NSInteger pages=self.PageContol.currentPage;
    if (pages==self.PageContol.numberOfPages-1) {
        pages=0;
    }
    else{
        pages++;
    }
    CGFloat offsetX=pages*self.ScrollViewHorizenal.frame.size.width;
    [self.ScrollViewHorizenal setContentOffset:CGPointMake(offsetX, 0) animated:YES];
    
}
@end
