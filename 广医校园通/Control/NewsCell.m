//
//  NewsCell.m
//  广医校园通
//
//  Created by 十大大 on 16/6/19.
//  Copyright © 2016年 Y. All rights reserved.
//

#import "NewsCell.h"
@interface NewsCell()
@property (weak, nonatomic) IBOutlet UIImageView *CellImage;
@property (weak, nonatomic) IBOutlet UILabel *CellTitle;
@property (weak, nonatomic) IBOutlet UILabel *CellPrice;

@end
@implementation NewsCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
