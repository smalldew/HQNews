//
//  ColumViewController.m
//  1016-项目-环球新军事
//
//  Created by Ibokan on 15/10/16.
//  Copyright © 2015年 yulu. All rights reserved.
//

#import "ColumViewController.h"
#import "AFNetworking.h"
#import "MJRefresh.h"
#import "DataManager.h"
#import "MilitarySituationCell.h"
@interface ColumViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UIButton *buttonOfHunt;
@property (strong, nonatomic) IBOutlet UIButton *buttonOfHistory;
@property (strong, nonatomic) IBOutlet UIButton *buttonOfFun;
@property (strong, nonatomic) IBOutlet UIButton *buttonOfNetFriend;
@property (strong, nonatomic) IBOutlet UITableView *tableViewOfColum;


@property (nonatomic,strong) NSMutableArray *mar;
@property (nonatomic,strong) UIRefreshControl *refreshControl;
@property (nonatomic,assign) int pages;
@property (nonatomic,assign) int maxPages;

@end

@implementation ColumViewController

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
    self.tableViewOfColum.dataSource=self;
    self.tableViewOfColum.delegate=self;
    // [self.view addSubview:self.focusNewsTableView];
    self.automaticallyAdjustsScrollViewInsets = NO;//去掉顶部空白
    
    [self.tableViewOfColum registerNib:[UINib nibWithNibName:@"MilitarySituationCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
    
    //创建refreshControl
    self.refreshControl =[[UIRefreshControl alloc]init];
    [self.refreshControl addTarget:self action:@selector(fetchData) forControlEvents:UIControlEventValueChanged];
    
    [self fetchData];
    [self configRefresh];
    
    
    [self.buttonOfHunt addTarget:self action:@selector(TapButtonOfHunt) forControlEvents:UIControlEventTouchUpInside];
    [self.buttonOfHistory addTarget:self action:@selector(TapButtonOfHistory) forControlEvents:UIControlEventTouchUpInside];
    [self.buttonOfFun addTarget:self action:@selector(TapButtonOfFun) forControlEvents:UIControlEventTouchUpInside];
    [self.buttonOfNetFriend addTarget:self action:@selector(TapButtonOfNetFriend) forControlEvents:UIControlEventTouchUpInside];

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
            [weak_self.tableViewOfColum reloadData];
            [weak_self.tableViewOfColum.header endRefreshing];
            [weak_self.tableViewOfColum.footer endRefreshing];
            
        }
        [weak_self.refreshControl endRefreshing];
    }];

}

-(void)fetchDataOfHunt
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
            [weak_self.tableViewOfColum reloadData];
            [weak_self.tableViewOfColum.header endRefreshing];
            [weak_self.tableViewOfColum.footer endRefreshing];
            
        }
        [weak_self.refreshControl endRefreshing];
        
    }];
    
}


-(void)fetchDataOfHistory
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
            [weak_self.tableViewOfColum reloadData];
            [weak_self.tableViewOfColum.header endRefreshing];
            [weak_self.tableViewOfColum.footer endRefreshing];
            
        }
        [weak_self.refreshControl endRefreshing];
        
    }];
    
}
-(void)fetchDataOfNetFriend
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
            [weak_self.tableViewOfColum reloadData];
            [weak_self.tableViewOfColum.header endRefreshing];
            [weak_self.tableViewOfColum.footer endRefreshing];
            
        }
        [weak_self.refreshControl endRefreshing];
        
    }];
    
}
-(void)fetchDataOfFun
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
            [weak_self.tableViewOfColum reloadData];
            [weak_self.tableViewOfColum.header endRefreshing];
            [weak_self.tableViewOfColum.footer endRefreshing];
            
        }
        [weak_self.refreshControl endRefreshing];
        
    }];
    
}








-(void)TapButtonOfHunt
{
    self.pages=1;
    self.maxPages=1;
    self.mar=[NSMutableArray new];
    
    //自动行高
    //self.focusNewsTableView.rowHeight = UITableViewAutomaticDimension;
    // self.focusNewsTableView.estimatedRowHeight = 120;
    //xib写的cell需要注册一个cell重用标识符
    //需要使用registerNib方法
    self.tableViewOfColum.dataSource=self;
    self.tableViewOfColum.delegate=self;
    // [self.view addSubview:self.focusNewsTableView];
    self.automaticallyAdjustsScrollViewInsets = NO;//去掉顶部空白
    
    [self.tableViewOfColum registerNib:[UINib nibWithNibName:@"MilitarySituationCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
    
    //创建refreshControl
    self.refreshControl =[[UIRefreshControl alloc]init];
    [self.refreshControl addTarget:self action:@selector(fetchDataOfHunt) forControlEvents:UIControlEventValueChanged];
    
    [self fetchDataOfHunt];
    [self configRefreshOfHunt];
}
-(void)TapButtonOfHistory
{
    self.pages=1;
    self.maxPages=1;
    self.mar=[NSMutableArray new];
    
    //自动行高
    //self.focusNewsTableView.rowHeight = UITableViewAutomaticDimension;
    // self.focusNewsTableView.estimatedRowHeight = 120;
    //xib写的cell需要注册一个cell重用标识符
    //需要使用registerNib方法
    self.tableViewOfColum.dataSource=self;
    self.tableViewOfColum.delegate=self;
    // [self.view addSubview:self.focusNewsTableView];
    self.automaticallyAdjustsScrollViewInsets = NO;//去掉顶部空白
    
    [self.tableViewOfColum registerNib:[UINib nibWithNibName:@"MilitarySituationCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
    
    //创建refreshControl
    self.refreshControl =[[UIRefreshControl alloc]init];
    [self.refreshControl addTarget:self action:@selector(fetchDataOfHistory) forControlEvents:UIControlEventValueChanged];
    
    [self fetchDataOfHistory];
    [self configRefreshOfHistory];
    
}
-(void)TapButtonOfFun
{
    self.pages=1;
    self.maxPages=1;
    self.mar=[NSMutableArray new];
    
    //自动行高
    //self.focusNewsTableView.rowHeight = UITableViewAutomaticDimension;
    // self.focusNewsTableView.estimatedRowHeight = 120;
    //xib写的cell需要注册一个cell重用标识符
    //需要使用registerNib方法
    self.tableViewOfColum.dataSource=self;
    self.tableViewOfColum.delegate=self;
    // [self.view addSubview:self.focusNewsTableView];
    self.automaticallyAdjustsScrollViewInsets = NO;//去掉顶部空白
    
    [self.tableViewOfColum registerNib:[UINib nibWithNibName:@"MilitarySituationCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
    
    //创建refreshControl
    self.refreshControl =[[UIRefreshControl alloc]init];
    [self.refreshControl addTarget:self action:@selector(fetchDataOfFun) forControlEvents:UIControlEventValueChanged];
    [self fetchDataOfFun];
    [self configRefreshOfFun];
}
-(void)TapButtonOfNetFriend
{
    self.pages=1;
    self.maxPages=1;
    self.mar=[NSMutableArray new];
    
    //自动行高
    //self.focusNewsTableView.rowHeight = UITableViewAutomaticDimension;
    // self.focusNewsTableView.estimatedRowHeight = 120;
    //xib写的cell需要注册一个cell重用标识符
    //需要使用registerNib方法
    self.tableViewOfColum.dataSource=self;
    self.tableViewOfColum.delegate=self;
    // [self.view addSubview:self.focusNewsTableView];
    self.automaticallyAdjustsScrollViewInsets = NO;//去掉顶部空白
    
    [self.tableViewOfColum registerNib:[UINib nibWithNibName:@"MilitarySituationCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
    
    //创建refreshControl
    self.refreshControl =[[UIRefreshControl alloc]init];
    [self.refreshControl addTarget:self action:@selector(fetchDataOfNetFriend) forControlEvents:UIControlEventValueChanged];
    [self fetchDataOfNetFriend];
    [self configRefreshOfNetFriend];
}

//配置上拉下拉
-(void)configRefresh
{
    self.tableViewOfColum.header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(dropDown)];
    self.tableViewOfColum.footer=[MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(nextPage)];
    
    [self.tableViewOfColum.header endRefreshing];
    [self.tableViewOfColum.footer endRefreshing];
    
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
-(void)configRefreshOfHunt
{
    self.tableViewOfColum.header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(dropDownOfHunt)];
    self.tableViewOfColum.footer=[MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(nextPageOfHunt)];
    
    [self.tableViewOfColum.header endRefreshing];
    [self.tableViewOfColum.footer endRefreshing];
    
}

-(void)dropDownOfHunt
{
    self.pages=1;
    self.mar=[NSMutableArray array];
    [self fetchDataOfHunt];
}
-(void)nextPageOfHunt
{
    self.pages++;
    [self fetchDataOfHunt];
}


//配置上拉下拉
-(void)configRefreshOfHistory
{
    self.tableViewOfColum.header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(dropDownOfHistory)];
    self.tableViewOfColum.footer=[MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(nextPageOfHistory)];
    
    [self.tableViewOfColum.header endRefreshing];
    [self.tableViewOfColum.footer endRefreshing];
    
}

-(void)dropDownOfHistory
{
    self.pages=1;
    self.mar=[NSMutableArray array];
    [self fetchDataOfHistory];
}
-(void)nextPageOfHistory
{
    self.pages++;
    [self fetchDataOfHistory];
}

//配置上拉下拉
-(void)configRefreshOfFun
{
    self.tableViewOfColum.header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(dropDownOfFun)];
    self.tableViewOfColum.footer=[MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(nextPageOfFun)];
    
    [self.tableViewOfColum.header endRefreshing];
    [self.tableViewOfColum.footer endRefreshing];
    
}

-(void)dropDownOfFun
{
    self.pages=1;
    self.mar=[NSMutableArray array];
    [self fetchDataOfFun];
}
-(void)nextPageOfFun
{
    self.pages++;
    [self fetchDataOfFun];
}

//配置上拉下拉
-(void)configRefreshOfNetFriend
{
    self.tableViewOfColum.header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(dropDownOfNetFriend)];
    self.tableViewOfColum.footer=[MJRefreshAutoFooter footerWithRefreshingTarget:self refreshingAction:@selector(nextPageOfNetFriend)];
    
    [self.tableViewOfColum.header endRefreshing];
    [self.tableViewOfColum.footer endRefreshing];
    
}

-(void)dropDownOfNetFriend
{
    self.pages=1;
    self.mar=[NSMutableArray array];
    [self fetchDataOfNetFriend];
}
-(void)nextPageOfNetFriend
{
    self.pages++;
    [self fetchDataOfNetFriend];
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
