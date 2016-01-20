//
//  DataManager.h
//  1016-项目-环球新军事
//
//  Created by Ibokan on 15/10/16.
//  Copyright © 2015年 yulu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "Constant.h"
#import "HQNews.h"

typedef void(^SuccessBlock)(NSArray *arr,int maxPage);
typedef void(^SuccessBlockHeader)(NSArray *arr);

@interface DataManager : NSObject

+(instancetype)shareManager;
//要闻的数据
-(void)startRequestWithSuccessBlock:(SuccessBlock)sBlock;
//要闻头部数据
-(void)startRequestWithSuccessBlockOfFocusNewsHeader:(SuccessBlockHeader)hBlock;

//图文的数据
-(void)startRequestWithSuccessBlockOfImageText:(SuccessBlock)sBlock;

//军情的数据
//-(void)startRequestWithSuccessBlockOfMilitarySituation:(SuccessBlock)sBlock;
-(void)startRequestWithSuccessBlockOfMilitarySituationHotSpot:(SuccessBlock)sBlock;
-(void)startRequestWithSuccessBlockOfMilitarySituationAttention:(SuccessBlock)sBlock;
-(void)startRequestWithSuccessBlockOfMilitarySituationFocus:(SuccessBlock)sBlock;
-(void)startRequestWithSuccessBlockOfMilitarySituationDefense:(SuccessBlock)sBlock;
//论坛中的数据
//-(void)startRequestWithSuccessBlockOfMilitaryColum:(SuccessBlock)sBlock;
-(void)startRequestWithSuccessBlockOfMilitaryColumHunt:(SuccessBlock)sBlock;
-(void)startRequestWithSuccessBlockOfMilitaryColumHistory:(SuccessBlock)sBlock;
-(void)startRequestWithSuccessBlockOfMilitaryColumFun:(SuccessBlock)sBlock;
-(void)startRequestWithSuccessBlockOfMilitaryColumNetFriend:(SuccessBlock)sBlock;
@end
