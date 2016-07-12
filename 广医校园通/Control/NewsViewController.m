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
    
    NSMutableAttributedString *text = [NSMutableAttributedString new];
    UIFont *font = [UIFont systemFontOfSize:35];
    
    {
        
//        NSMutableAttributedString *title= ;
//        [text appendAttributedString:[[NSAttributedString alloc] initWithString:title attributes:nil]];
//        
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:_Senttitle];
        one.yy_font = [UIFont boldSystemFontOfSize:30];
//        one.yy_color = [UIColor whiteColor];
//        YYTextShadow *shadow = [YYTextShadow new];
//        shadow.color = [UIColor colorWithWhite:0.000 alpha:0.490];
//        shadow.offset = CGSizeMake(0, 1);
//        shadow.radius = 5;
//        one.yy_textShadow = shadow;
        [text appendAttributedString:one];
        
        
        
        UIImage *image = [UIImage imageNamed:@"dribbble64_imageio"];
        image = [UIImage imageWithCGImage:image.CGImage scale:1 orientation:UIImageOrientationUp];
        
        NSMutableAttributedString *attachText = [NSMutableAttributedString yy_attachmentStringWithContent:image contentMode:UIViewContentModeCenter attachmentSize:image.size alignToFont:font alignment:YYTextVerticalAlignmentBottom];
        [text appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n" attributes:nil]];
        [text appendAttributedString:attachText];
        
    }
    {
        NSString *textinter = self.Text;
        [text appendAttributedString:[[NSAttributedString alloc] initWithString:textinter attributes:nil]];
        
        
    }
    //    _TextView.text=text;
    _label = [YYLabel new];
    _label.frame=CGRectMake(9, 80, 355, 500);
    //_label.backgroundColor=[UIColor redColor];
    _label.userInteractionEnabled = YES;
    _label.numberOfLines = 0;
    _label.textVerticalAlignment = YYTextVerticalAlignmentCenter;
    //_label.size = CGSizeMake(260, 260);
    //_label.center = CGPointMake(self.view.width / 2, self.view.height / 2);
    //_label.attributedText = text;
    //[self addSeeMoreButton];
    _label.attributedText = text;
    [self.view addSubview:_label];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
