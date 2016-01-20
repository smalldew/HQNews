//
//  HQNews.h
//  1016-项目-环球新军事
//
//  Created by Ibokan on 15/10/16.
//  Copyright © 2015年 yulu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HQNews : NSObject
//要闻头部
@property (nonatomic,strong) NSString *imageOfHeader;
//要闻中的属性
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *aid;
@property (nonatomic,copy) NSString *descript;
@property (nonatomic,copy) NSString *author;
@property (nonatomic,copy) NSString *comments;
@property (nonatomic,copy) NSString *image;
@property (nonatomic,copy) NSString *category;
@property (nonatomic,copy) NSString *pubDate;
//要闻详情中的属性
@property (nonatomic,strong) NSString *link;



//图文中的属性
@property (nonatomic,strong) NSString *titleOfImageText;
@property (nonatomic,copy) NSString *image1;
@property (nonatomic,copy) NSString *image2;
@property (nonatomic,copy) NSString *image3;
//军情中的属性
@property (nonatomic,strong) NSString *imageOfMilitarySituation;
@property (nonatomic,strong) NSString *titleOfMilitarySituation;
@property (nonatomic,strong) NSString *pubDateOfMilitarySituation;
@property (nonatomic,strong) NSString *commentsOfMilitarySituation;
//论坛中的属性同军情

@end
