//
//  AppleNewsViewController.m
//  广医校园通
//
//  Created by 十大大 on 16/7/12.
//  Copyright © 2016年 Y. All rights reserved.
//

#import "AppleNewsViewController.h"
#import "NewsCell.h"
#import "CrossScrollCell.h"
#import "AFNetworking.h"
#import "NewsViewController.h"
@interface AppleNewsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *TableView;

@property NSArray *array;
-(void)Network;
@property NSString *texx;
@end

@implementation AppleNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"校园新闻";
    [self Network];
    _TableView.backgroundColor=[UIColor redColor];
    [self setupRefresh];
    [self.TableView reloadData];
    
}
-(void)setupRefresh
{
    //1.添加刷新控件
    UIRefreshControl *control=[[UIRefreshControl alloc]init];
    [control addTarget:self action:@selector(refreshStateChange:) forControlEvents:UIControlEventValueChanged];
    [self.TableView addSubview:control];
    
    //2.马上进入刷新状态，并不会触发UIControlEventValueChanged事件
    [control beginRefreshing];
    
    // 3.加载数据
    [self refreshStateChange:control];
}
/**
 *  UIRefreshControl进入刷新状态：加载最新的数据
 */
-(void)refreshStateChange:(UIRefreshControl *)control
{
    [self Network];
    [self.TableView reloadData];
    
    // 3. 结束刷新
    [control endRefreshing];
}
-(void)Network
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:@"http://ipad-bjwb.bjd.com.cn/DigitalPublication/publish/Handler/APINewsList.ashx?date=20131129&startRecord=1&len=5&udid=1234567890&terminalType=Iphone&cid=213" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        // 这里可以获取到目前的数据请求的进度
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // 请求成功，解析数据
        //NSLog(@"%@", responseObject);
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        NSArray *News=[dic objectForKey:@"news"];
        
        self.array=News;
        [_TableView reloadData];
        //NSLog(@"pause");
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        // 请求失败
        NSLog(@"%@", [error localizedDescription]);
        
    }];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID=@"NewsBody";
    
    if (indexPath.row==0) {
        CrossScrollCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
        cell= [[[NSBundle mainBundle]loadNibNamed:@"CrossScrollCell" owner:nil options:nil]lastObject];
        return cell;
    }
    if (indexPath.row!=0) {
        NSDictionary *diction= self.array[indexPath.row-1];
        
        
        
        NSString *title=[diction objectForKey:@"title"];
        NSString *kind=[diction objectForKey:@"kind"];
        NewsCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
        cell= [[[NSBundle mainBundle]loadNibNamed:@"NewsCell" owner:nil options:nil]lastObject];
        cell.CellTitle.text=title;
        //NSLog(@"第一");
        return cell;
    }
    else return nil;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0) {
        return 240;
    }
    else return 55;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //加载数据时根据indexPath
    
    UIStoryboard *NewsInterface=[UIStoryboard storyboardWithName:@"NewsInterface" bundle:nil];
    NewsViewController *News=[NewsInterface instantiateViewControllerWithIdentifier:@"News"];
    
    
    NSDictionary *diction= self.array[indexPath.row-1];
    NSString *text=[diction objectForKey:@"summary"];
    NSString *title=[diction objectForKey:@"title"];
    NSString *kind=[diction objectForKey:@"kind"];
    
    News.Text=text;
    News.Senttitle=title;
    News.kind=kind;
    
    [self.navigationController pushViewController:News animated:YES];
    
}
@end
