//
//  MilitarySituationViewController.m
//  1016-项目-环球新军事
//
//  Created by Ibokan on 15/10/16.
//  Copyright © 2015年 yulu. All rights reserved.
//

#import "MilitarySituationViewController.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "MJRefresh.h"
#import "MilitarySituationCell.h"
#import "FocusNewsCell.h"
#import "DataManager.h"
#import "HQNews.h"
@interface MilitarySituationViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableViewOfMilitarySituation;
@property (strong, nonatomic) IBOutlet UIButton *buttonOfHotSpot;
@property (strong, nonatomic) IBOutlet UIButton *buttonOfAttention;
@property (strong, nonatomic) IBOutlet UIButton *buttonOfFocus;
@property (strong, nonatomic) IBOutlet UIButton *buttonOfDefense;
@property (nonatomic,strong) NSMutableArray *mar;
@property (nonatomic,strong) UIRefreshControl *refreshControl;
@property (nonatomic,assign) int pages;
@property (nonatomic,assign) int maxPages;
@end

@implementation MilitarySituationViewController



- (void)viewDidLoad {
    [super viewDidLoad];

    self.pages=1;
    self.maxPages=1;
    self.mar=[NSMutableArray new];
    
    //自动行高
    //self.focusNewsTableView.rowHeight = UITableViewAutomaticDimension;
    // self.focusNewsTableView.estimatedRowHeight = 120;
    //xib写的cell需要注册一个cell重用标识符
    //需要使用registerNib方法
    self.tableViewOfMilitarySituation.dataSource=self;
    self.tableViewOfMilitarySituation.delegate=self;
    // [self.view addSubview:self.focusNewsTableView];
    self.automaticallyAdjustsScrollViewInsets = NO;//去掉顶部空白
    
    [self.tableViewOfMilitarySituation registerNib:[UINib nibWithNibName:@"MilitarySituationCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
    
    //创建refreshControl
    self.refreshControl =[[UIRefreshControl alloc]init];
    [self.refreshControl addTarget:self action:@selector(fetchData) forControlEvents:UIControlEventValueChanged];
    
    [self fetchData];
    [self configRefresh];
    
   
     [self.buttonOfHotSpot addTarget:self action:@selector(TapButtonOfHotSpot) forControlEvents:UIControlEventTouchUpInside];
     [self.buttonOfAttention addTarget:self action:@selector(TapButtonOfAttention) forControlEvents:UIControlEventTouchUpInside];
     [self.buttonOfFocus addTarget:self action:@selector(TapButtonOfFocus) forControlEvents:UIControlEventTouchUpInside];
     [self.buttonOfDefense addTarget:self action:@selector(TapButtonOfDefense) forControlEvents:UIControlEventTouchUpInside];

    
   
}

-(void)fetchData
{
    if (self.pages>self.maxPages)
    {
        return;  //结束该方法
    }
    
    __weak typeof(self)weak_self = self;
    DataManager *manager=[DataManager shareManager];
    [manager startRequestWithSuccessBlockOfMilitarySituationHotSpot:^(NSArray *arr, int maxPage) {
        
        if (arr) {
            weak_self.maxPages=maxPage;
            [weak_self.mar addObjectsFromArray:arr];
            //刷新focusNewsTableView
            [weak_self.tableViewOfMilitarySituation reloadData];
            [weak_self.tableViewOfMilitarySituation.header endRefreshing];
            [weak_self.tableViewOfMilitarySituation.footer endRefreshing];
            
        }
        [weak_self.refreshControl endRefreshing];
        
    }];
}

-(void)fetchDataOfHotSpot
{
    if (self.pages>self.maxPages)
    {
        return;  //结束该方法
    }
    
    __weak typeof(self)weak_self = self;
    DataManager *manager=[DataManager shareManager];
    [manager startRequestWithSuccessBlockOfMilitarySituationHotSpot:^(NSArray *arr, int maxPage) {
        
        if (arr) {
            weak_self.maxPages=maxPage;
            [weak_self.mar addObjectsFromArray:arr];
            //刷新focusNewsTableView
            [weak_self.tableViewOfMilitarySituation reloadData];
            [weak_self.tableViewOfMilitarySituation.header endRefreshing];
            [weak_self.tableViewOfMilitarySituation.footer endRefreshing];
            
        }
        [weak_self.refreshControl endRefreshing];
        
    }];
   
}


-(void)fetchDataOfAttention
{
    if (self.pages>self.maxPages)
    {
        return;  //结束该方法
    }
    
    __weak typeof(self)weak_self = self;
    DataManager *manager=[DataManager shareManager];
    [manager startRequestWithSuccessBlockOfMilitarySituationAttention:^(NSArray *arr, int maxPage) {
        
        if (arr) {
            weak_self.maxPages=maxPage;
            [weak_self.mar addObjectsFromArray:arr];
            
            //刷新focusNewsTableView
            [weak_self.tableViewOfMilitarySituation reloadData];
            [weak_self.tableViewOfMilitarySituation.header endRefreshing];
            [weak_self.tableViewOfMilitarySituation.footer endRefreshing];
            
        }
        [weak_self.refreshControl endRefreshing];
        
    }];
    
}
-(void)fetchDataOfFocus
{
    if (self.pages>self.maxPages)
    {
        return;  //结束该方法
    }
    
    __weak typeof(self)weak_self = self;
    DataManager *manager=[DataManager shareManager];
    [manager startRequestWithSuccessBlockOfMilitarySituationFocus:^(NSArray *arr, int maxPage) {
        
        if (arr) {
            weak_self.maxPages=maxPage;
            [weak_self.mar addObjectsFromArray:arr];
            //刷新focusNewsTableView
            [weak_self.tableViewOfMilitarySituation reloadData];
            [weak_self.tableViewOfMilitarySituation.header endRefreshing];
            [weak_self.tableViewOfMilitarySituation.footer endRefreshing];
            
        }
        [weak_self.refreshControl endRefreshing];
        
    }];
    
}
-(void)fetchDataOfDefense
{
    if (self.pages>self.maxPages)
    {
        return;  //结束该方法
    }
    
    __weak typeof(self)weak_self = self;
    DataManager *manager=[DataManager shareManager];
    [manager startRequestWithSuccessBlockOfMilitarySituationDefense:^(NSArray *arr, int maxPage) {
        
        if (arr) {
            weak_self.maxPages=maxPage;
            [weak_self.mar addObjectsFromArray:arr];
            //刷新focusNewsTableView
            [weak_self.tableViewOfMilitarySituation reloadData];
            [weak_self.tableViewOfMilitarySituation.header endRefreshing];
            [weak_self.tableViewOfMilitarySituation.footer endRefreshing];
            
        }
        [weak_self.refreshControl endRefreshing];
        
    }];
    
}



-(void)TapButtonOfHotSpot
{
    self.pages=1;
    self.maxPages=1;
    self.mar=[NSMutableArray new];
    
    //自动行高
    //self.focusNewsTableView.rowHeight = UITableViewAutomaticDimension;
    // self.focusNewsTableView.estimatedRowHeight = 120;
    //xib写的cell需要注册一个cell重用标识符
    //需要使用registerNib方法
    self.tableViewOfMilitarySituation.dataSource=self;
    self.tableViewOfMilitarySituation.delegate=self;
    // [self.view addSubview:self.focusNewsTableView];
    self.automaticallyAdjustsScrollViewInsets = NO;//去掉顶部空白
    
    [self.tableViewOfMilitarySituation registerNib:[UINib nibWithNibName:@"MilitarySituationCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
    
    //创建refreshControl
    self.refreshControl =[[UIRefreshControl alloc]init];
    [self.refreshControl addTarget:self action:@selector(fetchDataOfHotSpot) forControlEvents:UIControlEventValueChanged];
   
    [self fetchDataOfHotSpot];
    [self configRefreshOfHotSpot];
}
-(void)TapButtonOfAttention
{
    self.pages=1;
    self.maxPages=1;
    self.mar=[NSMutableArray new];
    
    //自动行高
    //self.focusNewsTableView.rowHeight = UITableViewAutomaticDimension;
    // self.focusNewsTableView.estimatedRowHeight = 120;
    //xib写的cell需要注册一个cell重用标识符
    //需要使用registerNib方法
    self.tableViewOfMilitarySituation.dataSource=self;
    self.tableViewOfMilitarySituation.delegate=self;
    // [self.view addSubview:self.focusNewsTableView];
    self.automaticallyAdjustsScrollViewInsets = NO;//去掉顶部空白
    
    [self.tableViewOfMilitarySituation registerNib:[UINib nibWithNibName:@"MilitarySituationCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
    
    //创建refreshControl
    self.refreshControl =[[UIRefreshControl alloc]init];
    [self.refreshControl addTarget:self action:@selector(fetchDataOfAttention) forControlEvents:UIControlEventValueChanged];
    
    [self fetchDataOfAttention];
    [self configRefreshOfAttention];
    
}
-(void)TapButtonOfFocus
{
    self.pages=1;
    self.maxPages=1;
    self.mar=[NSMutableArray new];
    
    //自动行高
    //self.focusNewsTableView.rowHeight = UITableViewAutomaticDimension;
    // self.focusNewsTableView.estimatedRowHeight = 120;
    //xib写的cell需要注册一个cell重用标识符
    //需要使用registerNib方法
    self.tableViewOfMilitarySituation.dataSource=self;
    self.tableViewOfMilitarySituation.delegate=self;
    // [self.view addSubview:self.focusNewsTableView];
    self.automaticallyAdjustsScrollViewInsets = NO;//去掉顶部空白
    
    [self.tableViewOfMilitarySituation registerNib:[UINib nibWithNibName:@"MilitarySituationCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
    
    //创建refreshControl
    self.refreshControl =[[UIRefreshControl alloc]init];
    [self.refreshControl addTarget:self action:@selector(fetchDataOfFocus) forControlEvents:UIControlEventValueChanged];
    [self fetchDataOfFocus];
    [self configRefreshOfFocus];
}
-(void)TapButtonOfDefense
{
    self.pages=1;
    self.maxPages=1;
    self.mar=[NSMutableArray new];
    
    //自动行高
    //self.focusNewsTableView.rowHeight = UITableViewAutomaticDimension;
    // self.focusNewsTableView.estimatedRowHeight = 120;
    //xib写的cell需要注册一个cell重用标识符
    //需要使用registerNib方法
    self.tableViewOfMilitarySituation.dataSource=self;
    self.tableViewOfMilitarySituation.delegate=self;
    // [self.view addSubview:self.focusNewsTableView];
    self.automaticallyAdjustsScrollViewInsets = NO;//去掉顶部空白
    
    [self.tableViewOfMilitarySituation registerNib:[UINib nibWithNibName:@"MilitarySituationCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
    
    //创建refreshControl
    self.refreshControl =[[UIRefreshControl alloc]init];
    [self.refreshControl addTarget:self action:@selector(fetchDataOfDefense) forControlEvents:UIControlEventValueChanged];
    [self fetchDataOfDefense];
    [self configRefreshOfDefense];
}

//配置上拉下拉
-(void)configRefresh
{
    self.tableViewOfMilitarySituation.header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(dropDown)];
    self.tableViewOfMilitarySituation.footer=[MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(nextPage)];
    
    [self.tableViewOfMilitarySituation.header endRefreshing];
    [self.tableViewOfMilitarySituation.footer endRefreshing];
    
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






//配置上拉下拉
-(void)configRefreshOfHotSpot
{
    self.tableViewOfMilitarySituation.header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(dropDownOfHotSpot)];
    self.tableViewOfMilitarySituation.footer=[MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(nextPageOfHotSpot)];
    
    [self.tableViewOfMilitarySituation.header endRefreshing];
    [self.tableViewOfMilitarySituation.footer endRefreshing];
    
}

-(void)dropDownOfHotSpot
{
    self.pages=1;
    self.mar=[NSMutableArray array];
    [self fetchDataOfHotSpot];
}
-(void)nextPageOfHotSpot
{
    self.pages++;
    [self fetchDataOfHotSpot];
}


//配置上拉下拉
-(void)configRefreshOfAttention
{
    self.tableViewOfMilitarySituation.header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(dropDownOfAttention)];
    self.tableViewOfMilitarySituation.footer=[MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(nextPageOfAttention)];
    
    [self.tableViewOfMilitarySituation.header endRefreshing];
    [self.tableViewOfMilitarySituation.footer endRefreshing];
    
}

-(void)dropDownOfAttention
{
    self.pages=1;
    self.mar=[NSMutableArray array];
    [self fetchDataOfAttention];
}
-(void)nextPageOfAttention
{
    self.pages++;
    [self fetchDataOfAttention];
}

//配置上拉下拉
-(void)configRefreshOfFocus
{
    self.tableViewOfMilitarySituation.header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(dropDownOfFocus)];
    self.tableViewOfMilitarySituation.footer=[MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(nextPageOfFocus)];
    
    [self.tableViewOfMilitarySituation.header endRefreshing];
    [self.tableViewOfMilitarySituation.footer endRefreshing];
    
}

-(void)dropDownOfFocus
{
    self.pages=1;
    self.mar=[NSMutableArray array];
    [self fetchDataOfFocus];
}
-(void)nextPageOfFocus
{
    self.pages++;
    [self fetchDataOfFocus];
}

//配置上拉下拉
-(void)configRefreshOfDefense
{
    self.tableViewOfMilitarySituation.header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(dropDownOfDefense)];
    self.tableViewOfMilitarySituation.footer=[MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(nextPageOfDefense)];
    
    [self.tableViewOfMilitarySituation.header endRefreshing];
    [self.tableViewOfMilitarySituation.footer endRefreshing];
    
}

-(void)dropDownOfDefense
{
    self.pages=1;
    self.mar=[NSMutableArray array];
    [self fetchDataOfDefense];
}
-(void)nextPageOfDefense
{
    self.pages++;
    [self fetchDataOfDefense];
}




#pragma mark - 数据源
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return self.mar.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   MilitarySituationCell  *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
     HQNews *dic = self.mar[indexPath.row];
    //把字典给cell,cell去显示
    [cell configMilitarySituationCell:dic];
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110;
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
