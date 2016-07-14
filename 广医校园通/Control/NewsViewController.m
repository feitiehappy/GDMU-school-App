//
//  NewsViewController.m
//  广医校园通
//
//  Created by 十大大 on 16/7/12.
//  Copyright © 2016年 Y. All rights reserved.
//

#import "NewsViewController.h"
#import "YYText.h"
@interface NewsViewController ()
@property (nonatomic, strong) YYLabel *label;
@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *Scroll=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-26)];
    Scroll.contentSize=CGSizeMake(0, self.view.frame.size.height-100);
    //Scroll.backgroundColor=[UIColor redColor];
    [self.view addSubview:Scroll];
    NSMutableAttributedString *text = [NSMutableAttributedString new];
    UIFont *font = [UIFont systemFontOfSize:2];
    
    {
        

        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:_Senttitle];
        one.yy_font = [UIFont boldSystemFontOfSize:30];

        [text appendAttributedString:one];
        
        
        
        UIImage *image = [UIImage imageNamed:@"dribbble64_imageio"];
        image = [UIImage imageWithCGImage:image.CGImage scale:1 orientation:UIImageOrientationUp];
        
        NSMutableAttributedString *attachText = [NSMutableAttributedString yy_attachmentStringWithContent:image contentMode:UIViewContentModeCenter attachmentSize:image.size alignToFont:font alignment:YYTextVerticalAlignmentBottom];
        [text appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n" attributes:nil]];
        [text appendAttributedString:attachText];
        
    }
    {
        NSString *textinter = self.Text;
        NSMutableAttributedString *two = [[NSMutableAttributedString alloc] initWithString:textinter];
        two.yy_font= [UIFont boldSystemFontOfSize:14];
        [text appendAttributedString:two];
        
        
    }
    
    
    CGFloat width=self.view.frame.size.width;
    CGFloat height=self.view.frame.size.height-50;
    _label = [YYLabel new];
    
    _label.frame=CGRectMake(10, 0, width-15, height);
    
    _label.userInteractionEnabled = YES;
    _label.numberOfLines = 0;
    //_label.textVerticalAlignment = YYTextVerticalAlignmentCenter;
    
    _label.attributedText = text;
    
    
    //_label.backgroundColor=[UIColor grayColor];
    [Scroll addSubview:_label];
    //[self.view addSubview:_label];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
