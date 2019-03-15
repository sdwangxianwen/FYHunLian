//
//  PPBaseModel.h
//  pengpeng
//
//  Created by wang on 2019/3/5.
//  Copyright © 2019 wang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PPBaseModel : NSObject
@property(nonatomic,assign) NSInteger status;
@property(nonatomic,copy) NSString *msg;
@property (nonatomic,copy)NSString *des;
@property (nonatomic,copy)NSString *ID;
@property (nonatomic,assign)NSInteger data;
@end

NS_ASSUME_NONNULL_END
