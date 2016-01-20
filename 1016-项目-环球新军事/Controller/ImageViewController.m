//
//  ImageViewController.m
//  1016-项目-环球新军事
//
//  Created by Ibokan on 15/10/16.
//  Copyright © 2015年 yulu. All rights reserved.
//

#import "ImageViewController.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "MJRefresh.h"
#import "ImageTextCell.h"
#import "DataManager.h"
#import "HQNews.h"
@interface ImageViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableViewOfImageText;
@property (nonatomic,strong) NSMutableArray *mar;
@property (nonatomic,strong) UIRefreshControl *refreshControl;
@property (nonatomic,assign) int pages;
@property (nonatomic,assign) int maxPages;
@end

@implementation ImageViewController

-(void)fetchData
{
    if (self.pages>self.maxPages)
    {
        return;  //结束该方法
    }
    
    __weak typeof(self)weak_self = self;
    DataManager *manager=[DataManager shareManager];
    
    [manager startRequestWithSuccessBlockOfImageText:^(NSArray *arr, int maxPage) {
        
        if (arr) {
            weak_self.maxPages=maxPage;
            [weak_self.mar addObjectsFromArray:arr];
            //刷新focusNewsTableView
            [weak_self.tableViewOfImageText reloadData];
            
            [weak_self.tableViewOfImageText.header endRefreshing];
            [weak_self.tableViewOfImageText.footer endRefreshing];
            
        }
        [weak_self.refreshControl endRefreshing];
        
    }];
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.pages=1;
    self.maxPages=1;
    
    self.mar=[NSMutableArray new];
   
    self.tableViewOfImageText.dataSource=self;
    self.tableViewOfImageText.delegate=self;
    // [self.view addSubview:self.focusNewsTableView];
    self.automaticallyAdjustsScrollViewInsets = NO;//去掉顶部空白
    
    [self.tableViewOfImageText registerNib:[UINib nibWithNibName:@"ImageTextCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
    
    //创建refreshControl
    self.refreshControl =[[UIRefreshControl alloc]init];
    [self.refreshControl addTarget:self action:@selector(fetchData) forControlEvents:UIControlEventValueChanged];
    
    [self fetchData];
    [self configRefresh];
}


//配置上拉下拉
-(void)configRefresh
{
    self.tableViewOfImageText.header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(dropDown)];
    self.tableViewOfImageText.footer=[MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(nextPage)];
    
    [self.tableViewOfImageText.header endRefreshing];
    [self.tableViewOfImageText.footer endRefreshing];
    
}

-(void)dropDown
{
    self.pages=1;
    self.mar=[NSMutableArray array];
    [self fetchData];
}
-(void)nextPage
{
    self.pages++;
    [self fetchData];
}




-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.mar.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ImageTextCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    HQNews *dic=self.mar[indexPath.row];
    [cell configImageTextCell:dic];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150;
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
