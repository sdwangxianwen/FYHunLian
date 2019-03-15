//
//  IndustryModel.h
//  PengPeng
//
//  Created by edz on 2018/11/15.
//  Copyright © 2018年 pengpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IndustryModel : PPBaseModel

@property (nonatomic,copy) NSString *industryId;

@property (nonatomic,copy) NSString *name;

@property (nonatomic,copy) NSString *type;

@property (nonatomic,copy) NSString *parentId;

@property (nonatomic,copy) NSString *sort;

@end

NS_ASSUME_NONNULL_END
