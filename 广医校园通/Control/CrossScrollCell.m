//
//  CrossScrollCell.m
//  广医校园通
//
//  Created by 十大大 on 16/7/11.
//  Copyright © 2016年 Y. All rights reserved.
//

#import "CrossScrollCell.h"
#import "XRCarouselView.h"
@interface CrossScrollCell()
@property (weak, nonatomic) IBOutlet XRCarouselView *XRView;

@property  NSArray *picture;

@end
@implementation CrossScrollCell
-(NSArray*)picture
{
    NSArray *array=@[@"IMG_6359",@"IMG_6360",@"IMG_6361",@"IMG_6362",@"IMG_6364"];
    NSArray *image=@[[UIImage imageNamed:@"IMG_6359"],[UIImage imageNamed:@"IMG_6361"],[UIImage imageNamed:@"IMG_6360"],[UIImage imageNamed:@"IMG_6362"],[UIImage imageNamed:@"IMG_6364"]];
    _picture= image;
    return _picture;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    [self picture];
    _XRView.imageArray=_picture;
    _XRView.frame=CGRectMake(0, 0, 375, 200);
    _XRView.changeMode=ChangeModeFade;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
@end
