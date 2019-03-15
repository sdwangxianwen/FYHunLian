//
//  PPMeModel.m
//  pengpeng
//
//  Created by wang on 2019/3/10.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPMeModel.h"

@implementation PPMeModel

-(NSArray *)getThreeData {
    NSString *message = @"";
    if (self.dynamicMsgNum && [self.dynamicMsgNum isEqualToString:@"0"]) {
         message = [NSString stringWithFormat:@"%@条新回复",self.dynamicMsgNum];
    }
    NSString *gift = @"";
    if (self.flowingSize && self.flowingSize != 0) {
        gift = [NSString stringWithFormat:@"%d件",self.flowingSize];
    }
  
    return @[@{@"title" : @"我的二维码",
               @"subTitle":@"",
               @"isSubtitle":@(NO),
               @"isIcon":@(NO)
               },
             @{@"title" : @"收到的礼物",
               @"subTitle":gift,
               @"isSubtitle":@(self.flowingSize == 0),
               @"isIcon":@(NO)
               },
             @{@"title" : @"合作红娘",
               @"subTitle":@"",
               @"isSubtitle":@(NO),
               @"isIcon":@(NO)
               },
             @{@"title" : @"我的活动",
               @"subTitle":@"",
               @"isSubtitle":@(NO),
               @"isIcon":@(NO)
               },
             ];
}

-(NSArray *)getFourData {
    return @[@{@"title" : @"反馈",
               @"subTitle":@"",
               @"isSubtitle":@(NO),
               @"isIcon":@(NO)
               },
             @{@"title" : @"关于嘭嘭",
               @"subTitle":@"",
               @"isSubtitle":@(NO),
               @"isIcon":@(NO)
               },
             @{@"title" : @"退出登录",
               @"subTitle":@"",
               @"isSubtitle":@(NO),
               @"isIcon":@(NO)
               },
             ];
}
@end
