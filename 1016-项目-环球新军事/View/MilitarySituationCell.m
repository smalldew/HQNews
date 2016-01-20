//
//  MilitarySituationCell.m
//  1016-项目-环球新军事
//
//  Created by Ibokan on 15/10/18.
//  Copyright © 2015年 yulu. All rights reserved.
//

#import "MilitarySituationCell.h"
#import "UIButton+AFNetworking.h"
#import "HQNews.h"


@interface MilitarySituationCell ()
@property (strong, nonatomic) IBOutlet UIButton *buttonOfMilitarySituation;
@property (strong, nonatomic) IBOutlet UILabel *labelOfMilitarySituationTitle;
@property (strong, nonatomic) IBOutlet UILabel *labelOfMilitarySituationPubdate;
@property (strong, nonatomic) IBOutlet UILabel *labelOfMilitarySituationComments;



@end
@implementation MilitarySituationCell

-(void)configMilitarySituationCell:(HQNews *)hq
{
    NSString *str=hq.imageOfMilitarySituation;
    NSURL *url=[NSURL URLWithString:str];
      [self.buttonOfMilitarySituation setBackgroundImageForState:UIControlStateNormal withURL:url];
    
    
    self.labelOfMilitarySituationTitle.numberOfLines=0;
    self.labelOfMilitarySituationTitle.text=hq.titleOfMilitarySituation;
    
    self.labelOfMilitarySituationPubdate.text=hq.pubDateOfMilitarySituation;
    
    NSString *strComments=hq.commentsOfMilitarySituation;
    NSMutableString *mstr=[NSMutableString stringWithString:strComments];
    [mstr stringByAppendingFormat:@"%@",mstr];
    [mstr appendString:@"评论"];
    self.labelOfMilitarySituationComments.text=mstr;
    
}








- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
