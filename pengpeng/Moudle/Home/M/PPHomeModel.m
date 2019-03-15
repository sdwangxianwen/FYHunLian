//
//  PPHomeModel.m
//  pengpeng
//
//  Created by wang on 2019/3/7.
//  Copyright © 2019 wang. All rights reserved.
//

#import "PPHomeModel.h"

@implementation PPHomeModel
-(CGFloat)cellHight {
    if (!self.schoolName) {
        return (250+68)*kHeight;
    }
    if (!self.declaration) {
        return (250+68)*kHeight;
    }
    if (!self.declaration && !self.schoolName) {
        return 280*kHeight;
    }
    
    return (250 + 98)*kHeight;
}
@end
