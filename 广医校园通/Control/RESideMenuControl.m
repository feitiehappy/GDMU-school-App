//
//  RESideMenuControl.m
//  广医校园通
//
//  Created by 十大大 on 16/6/19.
//  Copyright © 2016年 Y. All rights reserved.
//

#import "RESideMenuControl.h"

@interface RESideMenuControl ()

@end

@implementation RESideMenuControl

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)awakeFromNib
{
    self.menuPreferredStatusBarStyle=UIStatusBarStyleLightContent;
    self.contentViewShadowColor=[UIColor blackColor];
    self.contentViewShadowOffset=CGSizeMake(0, 0);
    self.contentViewShadowOpacity=0.6;
    self.contentViewShadowRadius=12;
    self.contentViewShadowEnabled=NO;
    self.contentViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"contentViewController"];
    self.leftMenuViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"leftMenuViewController"];
    self.rightMenuViewController=[self.storyboard instantiateViewControllerWithIdentifier:@"RightMenuViewController"];
    
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
