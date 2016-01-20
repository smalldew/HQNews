//
//  FocusDetailViewController.m
//  1016-项目-环球新军事
//
//  Created by Ibokan on 15/10/19.
//  Copyright © 2015年 yulu. All rights reserved.
//

#import "FocusDetailViewController.h"
#import "AFNetworking.h"
#import "Constant.h"
#import "DataManager.h"
#import "HQNews.h"
@interface FocusDetailViewController ()
@property (strong, nonatomic) IBOutlet UIWebView *webViewOfFocusDetail;
@property (nonatomic,strong) AFHTTPRequestOperationManager *manager;
@end

@implementation FocusDetailViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableString *mstr=[NSMutableString stringWithFormat:@"%@?aid=%@",cIndex,self.str];
    
    self.manager=[AFHTTPRequestOperationManager manager];
    //手动解析
    self.manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    
    AFHTTPRequestOperation *op=[self.manager GET:mstr parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        //JSON解析
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        
        
        NSArray *arr=dic[self.str];
        
        NSString *str2 = arr[0][@"link"];
        
        
        NSURL *url=[NSURL URLWithString:str2];
        NSURLRequest *req=[NSURLRequest requestWithURL:url];
        [self.webViewOfFocusDetail loadRequest:req];
        
        //self.automaticallyAdjustsScrollViewInsets = NO;
        
        
        

}failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
    }];
    [op start];
 
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
