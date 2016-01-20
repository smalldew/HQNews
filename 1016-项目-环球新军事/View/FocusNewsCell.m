//
//  FocusNewsCell.m
//  1016-项目-环球新军事
//
//  Created by Ibokan on 15/10/18.
//  Copyright © 2015年 yulu. All rights reserved.
//

#import "FocusNewsCell.h"
#import "UIButton+AFNetworking.h"


@interface FocusNewsCell ()

@property (strong, nonatomic) IBOutlet UIButton *buttonOfFocusNews;
@property (strong, nonatomic) IBOutlet UILabel *labelOfFocusNewsTitle;
@property (strong, nonatomic) IBOutlet UILabel *labelOfFocusNewsPubDate;
@property (strong, nonatomic) IBOutlet UILabel *labelOfFocusNewsComments;

@end


@implementation FocusNewsCell


-(void)configFocusNewsCell:(HQNews *)hq
{
    NSString *str=hq.image;
    NSURL *url=[NSURL URLWithString:str];
    [self.buttonOfFocusNews setBackgroundImageForState:UIControlStateNormal withURL:url];
    
    self.labelOfFocusNewsTitle.numberOfLines=0;
    self.labelOfFocusNewsTitle.text=hq.title;
    
    self.labelOfFocusNewsPubDate.text=hq.pubDate;
    
    NSString *strComments=hq.comments;
    NSMutableString *mstr=[NSMutableString stringWithString:strComments];
    [mstr stringByAppendingFormat:@"%@",mstr];
    [mstr appendString:@"评论"];
    self.labelOfFocusNewsComments.text=mstr;
    
    [self.contentView layoutIfNeeded];
}




- (void)awakeFromNib {
    // Initialization code
    self.buttonOfFocusNews.layer.cornerRadius=10;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
