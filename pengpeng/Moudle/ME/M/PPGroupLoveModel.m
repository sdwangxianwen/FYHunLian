//
//  PPGroupLoveModel.m
//  pengpeng
//
//  Created by wang on 2019/3/11.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPGroupLoveModel.h"

@implementation PPGroupLoveModel
+(NSArray *)hongniangData {
    return @[@{@"title" : @"企业红娘",
               @"subTitle" : @"从此企业无单身",
               @"ImageName" : @"company_love"
               },
             @{@"title" : @"高校红娘",
               @"subTitle" : @"同一所学校的 TA",
               @"ImageName" : @"school_love"
               },
             @{@"title" : @"团体红娘",
               @"subTitle" : @"除了团队，还有爱",
               @"ImageName" : @"group_love"
               }
            ];
}
@end
