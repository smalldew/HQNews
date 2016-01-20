//
//  FocusNewsViewController.m
//  1016-项目-环球新军事
//
//  Created by Ibokan on 15/10/16.
//  Copyright © 2015年 yulu. All rights reserved.
//

#import "FocusNewsViewController.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
#import "MJRefresh.h"
#import "FocusNewsCell.h"
#import "DataManager.h"
#import "HQNews.h"
#import "FocusDetailViewController.h"
#import "UIView+MJExtension.h"

@interface FocusNewsViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *focusNewsTableView;
@property (strong, nonatomic) IBOutlet UIImageView *imageViewOfFocusHeader;
@property (strong, nonatomic) IBOutlet UIButton *button1;
@property (strong, nonatomic) IBOutlet UIButton *button2;
@property (strong, nonatomic) IBOutlet UIButton *button3;
@property (strong, nonatomic) IBOutlet UIButton *button4;

@property (strong, nonatomic) IBOutlet UIButton *button5;

@property (nonatomic,strong) NSMutableArray *mar;
@property (nonatomic,strong) UIRefreshControl *refreshControl;
@property (nonatomic,assign) int pages;
@property (nonatomic,assign) int maxPages;
@property (nonatomic,strong) AFHTTPRequestOperationManager *manager;

@property (nonatomic,strong) NSTimer *timer;
@end

@implementation FocusNewsViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.pages=(unsigned long *)1;
    self.maxPages=(unsigned long *)1;
    
    self.mar=[NSMutableArray new];
    
    //自动行高
    //self.focusNewsTableView.rowHeight = UITableViewAutomaticDimension;
   // self.focusNewsTableView.estimatedRowHeight = 120;
    //xib写的cell需要注册一个cell重用标识符
    //需要使用registerNib方法
    self.focusNewsTableView.dataSource=self;
    self.focusNewsTableView.delegate=self;

   // [self.view addSubview:self.focusNewsTableView];
    self.automaticallyAdjustsScrollViewInsets = NO;//去掉顶部空白
    
    [self.focusNewsTableView registerNib:[UINib nibWithNibName:@"FocusNewsCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"cell"];
    self.focusNewsTableView.header=[MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(dropDown)];
    self.focusNewsTableView.footer=[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(nextPage)];

   [self fetchData];
 
    
    self.button1.layer.cornerRadius=5;
    self.button2.layer.cornerRadius=5;
    self.button3.layer.cornerRadius=5;
    self.button4.layer.cornerRadius=5;
    self.button5.layer.cornerRadius=5;
   
    [self.button1 addTarget:self action:@selector(tapButton1) forControlEvents:UIControlEventTouchUpInside];
    [self.button2 addTarget:self action:@selector(tapButton2) forControlEvents:UIControlEventTouchUpInside];
    [self.button3 addTarget:self action:@selector(tapButton3) forControlEvents:UIControlEventTouchUpInside];
    [self.button4 addTarget:self action:@selector(tapButton4) forControlEvents:UIControlEventTouchUpInside];
    [self.button5 addTarget:self action:@selector(tapButton5) forControlEvents:UIControlEventTouchUpInside];
    
    
    DataManager *manager=[DataManager shareManager];
    [manager startRequestWithSuccessBlockOfFocusNewsHeader:^(NSArray *arr)
     {
         if (arr)
         {
            
        HQNews *hq1=arr[0];
             
        NSString *imageHeader=hq1.imageOfHeader;
             
        [self.imageViewOfFocusHeader setImageWithURL:[NSURL URLWithString:imageHeader]];
        
//             self.timer=[NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(rollImage) userInfo:nil repeats:YES];
         }
  
    }];
  
}



-(void)fetchData
{
    if (self.pages>self.maxPages)
    {
        return;  //结束该方法
    }
    
    __weak typeof(self)weak_self = self;
    DataManager *manager=[DataManager shareManager];
    
    [manager startRequestWithSuccessBlock:^(NSArray *arr,int maxpage) {
        if (arr) {
            weak_self.maxPages=maxpage;
            [weak_self.mar addObjectsFromArray:arr];
            NSLog(@"weak_self.mar addObjectsFromArray=%@",weak_self.mar);
            //刷新focusNewsTableView
            [weak_self.focusNewsTableView reloadData];
            [weak_self.focusNewsTableView.header endRefreshing];
            [weak_self.focusNewsTableView.footer endRefreshing];
            
        }
        [weak_self.refreshControl endRefreshing];
        
    }];
}

-(void)dropDown
{
    //self.pages=1;
    self.mar=[NSMutableArray array];
    [self fetchData];
}
-(void)nextPage
{
    self.pages++;
    [self fetchData];
}






-(void)tapButton1
{
    DataManager *manager=[DataManager shareManager];
    [manager startRequestWithSuccessBlockOfFocusNewsHeader:^(NSArray *arr) {
        
        if (arr)
        {
            HQNews *hq1=arr[0];
            NSString *imageHeader=hq1.imageOfHeader;
            
            [self.imageViewOfFocusHeader setImageWithURL:[NSURL URLWithString:imageHeader]];
           self.button1.backgroundColor=[UIColor lightGrayColor];
        }
    }];
   
    
}
-(void)tapButton2
{
    DataManager *manager=[DataManager shareManager];
    [manager startRequestWithSuccessBlockOfFocusNewsHeader:^(NSArray *arr) {
        
        if (arr)
        {
            HQNews *hq1=arr[1];
            NSString *imageHeader=hq1.imageOfHeader;
            
            [self.imageViewOfFocusHeader setImageWithURL:[NSURL URLWithString:imageHeader]];
          //  self.button2.backgroundColor=[UIColor lightGrayColor];
        }
    }];
    
}
-(void)tapButton3
{
    DataManager *manager=[DataManager shareManager];
    [manager startRequestWithSuccessBlockOfFocusNewsHeader:^(NSArray *arr) {
        
        if (arr)
        {
            HQNews *hq1=arr[2];
            NSString *imageHeader=hq1.imageOfHeader;
            
            [self.imageViewOfFocusHeader setImageWithURL:[NSURL URLWithString:imageHeader]];
           // self.button3.backgroundColor=[UIColor lightGrayColor];
        }
    }];
    
}
-(void)tapButton4
{
    DataManager *manager=[DataManager shareManager];
    [manager startRequestWithSuccessBlockOfFocusNewsHeader:^(NSArray *arr) {
        
        if (arr)
        {
            HQNews *hq1=arr[3];
            NSString *imageHeader=hq1.imageOfHeader;
            
            [self.imageViewOfFocusHeader setImageWithURL:[NSURL URLWithString:imageHeader]];
           // self.button4.backgroundColor=[UIColor lightGrayColor];
        }
    }];
    
}
-(void)tapButton5
{
    DataManager *manager=[DataManager shareManager];
    [manager startRequestWithSuccessBlockOfFocusNewsHeader:^(NSArray *arr) {
        
        if (arr)
        {
            HQNews *hq1=arr[4];
            NSString *imageHeader=hq1.imageOfHeader;
            
            [self.imageViewOfFocusHeader setImageWithURL:[NSURL URLWithString:imageHeader]];
            //self.button5.backgroundColor=[UIColor lightGrayColor];
        }
    }];
    
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
    
    FocusNewsCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
   
    HQNews *dic =self.mar[indexPath.row];
    
    //把字典给cell,cell去显示
    [cell configFocusNewsCell:dic];
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 105;
}

-(void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //推出webview
    UIStoryboard *focusSb=[UIStoryboard storyboardWithName:@"FocusDetails" bundle:[NSBundle mainBundle]];
    FocusDetailViewController *focusNv=[focusSb instantiateViewControllerWithIdentifier:@"FocusDetailViewController"];
    
    HQNews *new = self.mar[indexPath.row];
    focusNv.str = new.aid;
    [self.navigationController pushViewController:focusNv animated:YES];
    

    
}

//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
