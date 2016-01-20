//
//  DataManager.m
//  1016-项目-环球新军事
//
//  Created by Ibokan on 15/10/16.
//  Copyright © 2015年 yulu. All rights reserved.
//

#import "DataManager.h"


@interface DataManager ()
@property (nonatomic,strong) AFHTTPRequestOperationManager *manager;
@end


@implementation DataManager



- (instancetype)init
{
    self = [super init];
    if (self) {
        self.manager=[AFHTTPRequestOperationManager manager];
        //手动解析
        self.manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    }
    return self;
}

+(instancetype)shareManager
{
    static DataManager *data=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        data=[[DataManager alloc]init];
        
    });
    
    return data;
    
}

-(void)startRequestWithSuccessBlock:(SuccessBlock)sBlock
{
 //利用AF的manager去发起请求
    AFHTTPRequestOperation *op=[self.manager GET:kIndex parameters:@{@"act":@"index",@"page":@"7"}success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject)
    {
        
        NSMutableArray *marr=[NSMutableArray new];
        //JSON解析
        NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"要闻中的dic=%@#",dic);
        int maxpage=[dic[@"maxpage"] intValue];
        NSArray *arr=dic[@"item"];
       
        [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            HQNews *news=[HQNews new];
            news.title=obj[@"title"];
            news.aid=obj[@"aid"];
            news.descript=obj[@"description"];
            news.pubDate=obj[@"pubDate"];
            news.author=obj[@"author"];
            news.image=obj[@"image"];
            news.category=obj[@"category"];
            news.comments=obj[@"comments"];
            [marr addObject:news];
            
        }];
       
        //请求成功并且把数据解析成model数据,调用block
       // [op start];
        if (sBlock)
        {
            sBlock(marr,maxpage);
        }
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
    }];
    
    [op start];
}

-(void)startRequestWithSuccessBlockOfFocusNewsHeader:(SuccessBlockHeader)hBlock
{
    //利用AF的manager去发起请求
    AFHTTPRequestOperation *op=[self.manager GET:kIndex parameters:@{@"act":@"index",@"page":@"1"}success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject)
      {
         NSMutableArray *marr=[NSMutableArray new];
                                    //JSON解析
  NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
                                    
  NSArray *arr=dic[@"slide"];
                                    
  [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                                        
  HQNews *news=[HQNews new];

  news.imageOfHeader=obj[@"image"];
      [marr addObject:news];
    
   }];
        
      if (hBlock)
         {
            hBlock(marr);
        }
                                    
     } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
                                    
       NSLog(@"%@",error);
   }];
    
    [op start];

    
}






-(void)startRequestWithSuccessBlockOfMilitarySituationHotSpot:(SuccessBlock)sBlock
{
    
    //利用AF的manager去发起请求
    AFHTTPRequestOperation *op=[self.manager GET:kIndex parameters:@{@"act":@"1",@"page":@"1"}success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject)
     {
                                    
    NSMutableArray *marr=[NSMutableArray new];
    //JSON解析
   NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
         
   int maxpage=[dic[@"maxpage"] intValue];
   NSArray *arr=dic[@"item"];
    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        HQNews *news=[HQNews new];
        news.titleOfMilitarySituation=obj[@"title"];
        news.imageOfMilitarySituation=obj[@"image"];
        news.pubDateOfMilitarySituation=obj[@"pubDate"];
        news.commentsOfMilitarySituation=obj[@"comments"];
        
        [marr addObject:news];
       }];
     //请求成功并且把数据解析成model数据,调用block
     
    if (sBlock)
         {
            sBlock(marr,maxpage);
          }
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
         NSLog(@"%@",error);
    }];
    
    [op start];
}

-(void)startRequestWithSuccessBlockOfMilitarySituationAttention:(SuccessBlock)sBlock
{
    //利用AF的manager去发起请求
    AFHTTPRequestOperation *op=[self.manager GET:kIndex parameters:@{@"act":@"2",@"page":@"1"}success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject)
                                {
                                    
       NSMutableArray *marr=[NSMutableArray new];
    //JSON解析
    NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
                                    
    int maxpage=[dic[@"maxpage"] intValue];
     NSArray *arr=dic[@"item"];
                                   
     [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
         
     HQNews *news=[HQNews new];
    news.titleOfMilitarySituation=obj[@"title"];
     news.imageOfMilitarySituation=obj[@"image"];
      news.pubDateOfMilitarySituation=obj[@"pubDate"];
      news.commentsOfMilitarySituation=obj[@"comments"];
                                        
      [marr addObject:news];
       
      }];
   //请求成功并且把数据解析成model数据,调用block
                                    
   if (sBlock)
         {
            sBlock(marr,maxpage);
            }
       } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
              NSLog(@"%@",error);
       }];
    
    [op start];
    
}

-(void)startRequestWithSuccessBlockOfMilitarySituationFocus:(SuccessBlock)sBlock
{
    
    //利用AF的manager去发起请求
    AFHTTPRequestOperation *op=[self.manager GET:kIndex parameters:@{@"act":@"3",@"page":@"1"}success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject)
                                {
                                    
                                    NSMutableArray *marr=[NSMutableArray new];
                                    //JSON解析
                                    NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
                                    
                                    int maxpage=[dic[@"maxpage"] intValue];
                                    NSArray *arr=dic[@"item"];
                                    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                                        
                                        HQNews *news=[HQNews new];
                                        news.titleOfMilitarySituation=obj[@"title"];
                                        news.imageOfMilitarySituation=obj[@"image"];
                                        news.pubDateOfMilitarySituation=obj[@"pubDate"];
                                        news.commentsOfMilitarySituation=obj[@"comments"];
                                        
                                        [marr addObject:news];
                                    }];
                                    //请求成功并且把数据解析成model数据,调用block
                                    
                                    if (sBlock)
                                    {
                                        sBlock(marr,maxpage);
                                    }
                                } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
                                    NSLog(@"%@",error);
                                }];
    
    [op start];
 
}






-(void)startRequestWithSuccessBlockOfMilitarySituationDefense:(SuccessBlock)sBlock
{
    
    //利用AF的manager去发起请求
    AFHTTPRequestOperation *op=[self.manager GET:kIndex parameters:@{@"act":@"4",@"page":@"1"}success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject)
                                {
                                    
                                    NSMutableArray *marr=[NSMutableArray new];
                                    //JSON解析
                                    NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
                                    
                                    int maxpage=[dic[@"maxpage"] intValue];
                                    NSArray *arr=dic[@"item"];
                                    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                                        
                                        HQNews *news=[HQNews new];
                                        news.titleOfMilitarySituation=obj[@"title"];
                                        news.imageOfMilitarySituation=obj[@"image"];
                                        news.pubDateOfMilitarySituation=obj[@"pubDate"];
                                        news.commentsOfMilitarySituation=obj[@"comments"];
                                        
                                        [marr addObject:news];
                                    }];
                                    //请求成功并且把数据解析成model数据,调用block
                                    
                                    if (sBlock)
                                    {
                                        sBlock(marr,maxpage);
                                    }
                                } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
                                    NSLog(@"%@",error);
                                }];
    
    [op start];
 
}




-(void)startRequestWithSuccessBlockOfImageText:(SuccessBlock)sBlock
{
    //利用AF的manager去发起请求
    AFHTTPRequestOperation *op=[self.manager GET:kIndex parameters:@{@"act":@"tuwen",@"page":@"1"}success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject)
                                {
                                    
  NSMutableArray *marr=[NSMutableArray new];
                                    //JSON解析
    NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
    
    int maxpage=[dic[@"maxpage"] intValue];
                                    
    NSArray *arr=dic[@"item"];
                                    
    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                                        
        HQNews *news=[HQNews new];
        news.titleOfImageText=obj[@"title"];
        NSArray *image_arr=obj[@"image_arr"];
        
        news.image1=image_arr[0];
        news.image2=image_arr[1];
        news.image3=image_arr[2];
         
        [marr addObject:news];
        }];
                                    
        //请求成功并且把数据解析成model数据,调用block
        // [op start];
         if (sBlock)
           {
             sBlock(marr,maxpage);
            }
        } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
                NSLog(@"%@",error);
        }];
    
    [op start];
    
}

-(void)startRequestWithSuccessBlockOfMilitaryColumHunt:(SuccessBlock)sBlock
{
    
    //利用AF的manager去发起请求
    AFHTTPRequestOperation *op=[self.manager GET:kIndex parameters:@{@"act":@"5",@"page":@"1"}success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject)
                                {
                                    
                                    NSMutableArray *marr=[NSMutableArray new];
                                    //JSON解析
                                    NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
                                    
                                    int maxpage=[dic[@"maxpage"] intValue];
                                    NSArray *arr=dic[@"item"];
                                    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                                        HQNews *news=[HQNews new];
                                        news.titleOfMilitarySituation=obj[@"title"];
                                        news.imageOfMilitarySituation=obj[@"image"];
                                        news.pubDateOfMilitarySituation=obj[@"pubDate"];
                                        news.commentsOfMilitarySituation=obj[@"comments"];
                                        
                                        [marr addObject:news];
                                    }];
                                    //请求成功并且把数据解析成model数据,调用block
                                    
                                    if (sBlock)
                                    {
                                        sBlock(marr,maxpage);
                                    }
                                } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
                                    NSLog(@"%@",error);
                                }];
    
    [op start];
}


-(void)startRequestWithSuccessBlockOfMilitaryColumHistory:(SuccessBlock)sBlock
{
    
    //利用AF的manager去发起请求
    AFHTTPRequestOperation *op=[self.manager GET:kIndex parameters:@{@"act":@"6",@"page":@"1"}success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject)
                                {
                                    
                                    NSMutableArray *marr=[NSMutableArray new];
                                    //JSON解析
                                    NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
                                    
                                    int maxpage=[dic[@"maxpage"] intValue];
                                    NSArray *arr=dic[@"item"];
                                    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                                        HQNews *news=[HQNews new];
                                        news.titleOfMilitarySituation=obj[@"title"];
                                        news.imageOfMilitarySituation=obj[@"image"];
                                        news.pubDateOfMilitarySituation=obj[@"pubDate"];
                                        news.commentsOfMilitarySituation=obj[@"comments"];
                                        
                                        [marr addObject:news];
                                    }];
                                    //请求成功并且把数据解析成model数据,调用block
                                    
                                    if (sBlock)
                                    {
                                        sBlock(marr,maxpage);
                                    }
                                } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
                                    NSLog(@"%@",error);
                                }];
    
    [op start];
}

-(void)startRequestWithSuccessBlockOfMilitaryColumFun:(SuccessBlock)sBlock
{
    
    //利用AF的manager去发起请求
    AFHTTPRequestOperation *op=[self.manager GET:kIndex parameters:@{@"act":@"7",@"page":@"1"}success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject)
                                {
                                    
                                    NSMutableArray *marr=[NSMutableArray new];
                                    //JSON解析
                                    NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
                                    
                                    int maxpage=[dic[@"maxpage"] intValue];
                                    NSArray *arr=dic[@"item"];
                                    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                                        HQNews *news=[HQNews new];
                                        news.titleOfMilitarySituation=obj[@"title"];
                                        news.imageOfMilitarySituation=obj[@"image"];
                                        news.pubDateOfMilitarySituation=obj[@"pubDate"];
                                        news.commentsOfMilitarySituation=obj[@"comments"];
                                        
                                        [marr addObject:news];
                                    }];
                                    //请求成功并且把数据解析成model数据,调用block
                                    
                                    if (sBlock)
                                    {
                                        sBlock(marr,maxpage);
                                    }
                                } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
                                    NSLog(@"%@",error);
                                }];
    
    [op start];
}

-(void)startRequestWithSuccessBlockOfMilitaryColumNetFriend:(SuccessBlock)sBlock
{
    
    //利用AF的manager去发起请求
    AFHTTPRequestOperation *op=[self.manager GET:kIndex parameters:@{@"act":@"8",@"page":@"1"}success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject)
{
                                    
NSMutableArray *marr=[NSMutableArray new];
    //JSON解析
     NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
                                    
    int maxpage=[dic[@"maxpage"] intValue];
    NSArray *arr=dic[@"item"];
    [arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
     HQNews *news=[HQNews new];
     news.titleOfMilitarySituation=obj[@"title"];
     news.imageOfMilitarySituation=obj[@"image"];
     news.pubDateOfMilitarySituation=obj[@"pubDate"];
    news.commentsOfMilitarySituation=obj[@"comments"];
                                        
       [marr addObject:news];
 }];
   //请求成功并且把数据解析成model数据,调用block
                                    
 if (sBlock)
    {
     sBlock(marr,maxpage);
     }
 } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
           NSLog(@"%@",error);
 }];
    
    [op start];
}













@end
