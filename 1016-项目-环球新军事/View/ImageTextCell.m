//
//  ImageTextCell.m
//  1016-项目-环球新军事
//
//  Created by Ibokan on 15/10/18.
//  Copyright © 2015年 yulu. All rights reserved.
//

#import "ImageTextCell.h"
#import "UIButton+AFNetworking.h"
#import "HQNews.h"

@interface ImageTextCell ()
@property (strong, nonatomic) IBOutlet UILabel *labelOfTitle;
@property (strong, nonatomic) IBOutlet UIButton *buttonOfImage1;
@property (strong, nonatomic) IBOutlet UIButton *buttonOfImage2;
@property (strong, nonatomic) IBOutlet UIButton *buttonOfImage3;

@end



@implementation ImageTextCell


-(void)configImageTextCell:(HQNews *)hq
{
    self.labelOfTitle.text=hq.titleOfImageText;
    NSString *str1=hq.image1;
    NSURL *url1=[NSURL URLWithString:str1];
      [self.buttonOfImage1 setBackgroundImageForState:UIControlStateNormal withURL:url1];
    
    NSString *str2=hq.image2;
    NSURL *url2=[NSURL URLWithString:str2];
    [self.buttonOfImage2 setImageForState:UIControlStateNormal withURL:url2];
    
    NSString *str3=hq.image3;
    NSURL *url3=[NSURL URLWithString:str3];
    [self.buttonOfImage3 setImageForState:UIControlStateNormal withURL:url3];
    
    
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
