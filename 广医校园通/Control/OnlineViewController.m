//
//  OnlineViewController.m
//  广医校园通
//
//  Created by 十大大 on 16/6/1.
//  Copyright © 2016年 Y. All rights reserved.
//

#import "OnlineViewController.h"

@interface OnlineViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *TableView;

@property (nonatomic,copy) NSArray *Gracy;
@property(nonatomic,copy)NSArray *Picture;
@end

@implementation OnlineViewController

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.Gracy.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text=self.Gracy[indexPath.row];
    cell.imageView.image=[UIImage imageNamed:self.Picture[indexPath.row]];
    return cell;
}
-(NSArray*)Picture
{
    NSArray *pic=@[@"课程表",@"旗帜",@"成绩"];
    _Picture=pic;
    return _Picture;
}
-(NSArray*)Gracy
{
    
    NSArray *sd=@[@"课表查询",@"科室查询",@"成绩查询"];
    _Gracy=sd;
    return _Gracy;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==1) {
        UIStoryboard *secondStoryBoard=[UIStoryboard storyboardWithName:@"LoginView" bundle:nil];
        UIViewController *test=[secondStoryBoard instantiateViewControllerWithIdentifier:@"LoginView"];
        [self.navigationController pushViewController:test animated:YES];
        

    }
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.TableView.rowHeight=80;
    
    NSLog(@"fg");
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

- (IBAction)btn:(UIButton *)sender {
}
@end
