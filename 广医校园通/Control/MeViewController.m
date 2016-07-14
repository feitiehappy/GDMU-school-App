//
//  MeViewController.m
//  广医校园通
//
//  Created by 十大大 on 16/6/1.
//  Copyright © 2016年 Y. All rights reserved.
//

#import "MeViewController.h"

@interface MeViewController ()<UITableViewDelegate,UITableViewDataSource>
- (IBAction)Login:(UIButton *)sender;
@property (nonatomic,copy) NSArray *Gracy;
@property (weak, nonatomic) IBOutlet UITableView *TableView;
@property(nonatomic,copy)NSArray *picture;
@end

@implementation MeViewController
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.Gracy.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    cell.textLabel.text=self.Gracy[indexPath.row];
    cell.imageView.image=[UIImage imageNamed:self.picture[indexPath.row]];
    
    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSArray*)picture
{
    NSArray *pic=@[@"我的资料",@"我的收藏",@"我的消息",@"教务系统信息",@"设置"];
    _picture=pic;
    return _picture;
}
-(NSArray*)Gracy
{
    
    NSArray *sd=@[@"我的资料",@"我的收藏",@"我的消息",@"教务系统信息",@"设置"];
    _Gracy=sd;
    return _Gracy;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.TableView.separatorColor=[UIColor clearColor];
//    self.TableView.rowHeight=45;
    
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

- (IBAction)Login:(UIButton *)sender {
    UIStoryboard *LoginStoryBoard=[UIStoryboard storyboardWithName:@"LoginView" bundle:nil];
    UIViewController *Login=[LoginStoryBoard instantiateViewControllerWithIdentifier:@"LoginView"];
    [self presentViewController:Login animated:YES completion:nil];
    
    
}
@end
