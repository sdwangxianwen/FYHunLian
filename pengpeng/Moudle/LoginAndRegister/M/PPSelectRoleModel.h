//
//  PPSelectRoleModel.h
//  pengpeng
//
//  Created by wang on 2019/3/6.
//  Copyright © 2019 wang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PPSelectRoleModel : NSObject
+(NSArray *)getRoleInfo;
@property (nonatomic,copy)NSString *title;
@property (nonatomic,copy)NSString *subTitle;
@property (nonatomic,copy)NSString *ID;
@property (nonatomic,copy)NSString *imageName;
@end

NS_ASSUME_NONNULL_END
