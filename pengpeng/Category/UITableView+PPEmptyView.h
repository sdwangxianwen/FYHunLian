//
//  UITableView+PPEmptyView.h
//  pengpeng
//
//  Created by wang on 2019/3/12.
//  Copyright © 2019 wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (PPEmptyView)
@property (nonatomic, strong, readonly) UIView *emptyView;
-(void)addEmptyViewWithImageName:(NSString*)imageName title:(NSString*)title;
@end


