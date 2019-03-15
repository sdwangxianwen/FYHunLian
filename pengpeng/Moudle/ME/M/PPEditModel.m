//
//  PPEditModel.m
//  pengpeng
//
//  Created by wang on 2019/3/10.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPEditModel.h"

@implementation PPEditModel
+(NSArray *)getSectionData {
    return @[@{@"title" : @"",
               @"imageName" : @""
               },
             @{@"title" : @"基本资料",
               @"imageName" : @"edit"
               },
             @{@"title" : @"爱好",
               @"imageName" : @"edit_jia"
               },
             @{@"title" : @"性格",
               @"imageName" : @"edit_jia"
               },
             @{@"title" : @"经历",
               @"imageName" : @"edit"
               },
             @{@"title" : @"生活",
               @"imageName" : @"edit"
               },
             @{@"title" : @"聊聊爱情",
               @"imageName" : @"edit_jia"
               },
             ];
}

+(NSArray *)getZiliaoData {
    return @[@{@"title" : @"血型:",
               @"subTitle" : @"你属于哪个型"
               },
             @{@"title" : @"身高:",
               @"subTitle" : @"cm晓得不"
               },
             @{@"title" : @"体重:",
               @"subTitle" : @"kg你懂哇"
               },
             @{@"title" : @"户口:",
               @"subTitle" : @"说，户口本在哪"
               },
             @{@"title" : @"现居地:",
               @"subTitle" : @"现在住的地方啊"
               },
             @{@"title" : @"择偶宣言:",
               @"subTitle" : @"爱就要大声说出来"
               }
             ];
}
+(NSArray *)getJingliData {
    return @[@{@"title" : @"行业:",
               @"subTitle" : @""
               },
             @{@"title" : @"职位:",
               @"subTitle" : @""
               },
             @{@"title" : @"收入:",
               @"subTitle" : @""
               },
             @{@"title" : @"毕业院校:",
               @"subTitle" : @""
               },
             @{@"title" : @"最高学历:",
               @"subTitle" : @""
               },
             @{@"title" : @"现状:",
               @"subTitle" : @""
               }
             ];
}
+(NSArray *)getLifeData {
    return @[@{@"title" : @"是否有车:",
               @"subTitle" : @""
               },
             @{@"title" : @"是否有房:",
               @"subTitle" : @""
               }
             ];
}
@end
