//
//  UITableView+PPEmptyView.m
//  pengpeng
//
//  Created by wang on 2019/3/12.
//  Copyright © 2019 wang. All rights reserved.
//

#import "UITableView+PPEmptyView.h"
#import <objc/runtime.h>

static char UITableViewEmptyView;

@implementation UITableView (PPEmptyView)
@dynamic emptyView;
- (UIView *)emptyView {
    return objc_getAssociatedObject(self, &UITableViewEmptyView);
}
- (void)setEmptyView:(UIView *)emptyView {
    [self willChangeValueForKey:@"EmptyView"];
    objc_setAssociatedObject(self, &UITableViewEmptyView,
                             emptyView,
                             OBJC_ASSOCIATION_ASSIGN);
    [self didChangeValueForKey:@"EmptyView"];
}

-(void)addEmptyViewWithImageName:(NSString*)imageName title:(NSString*)title {
    if (!self.emptyView) {
        CGRect frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        UIImage* image = [UIImage imageNamed:imageName];
        NSString* text = title;
        UIView* noMessageView = [[UIView alloc] initWithFrame:frame];
        noMessageView.backgroundColor = [UIColor whiteColor];
        UIImageView *carImageView = [[UIImageView alloc] initWithFrame:CGRectMake((frame.size.width-image.size.width)/2, (frame.size.height)/2 - image.size.height, image.size.width, image.size.height)];
        [carImageView setImage:image];
        [noMessageView addSubview:carImageView];
        
        UILabel *noInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(carImageView.frame)+20, frame.size.width, 20)];
        noInfoLabel.textAlignment = NSTextAlignmentCenter;
        noInfoLabel.textColor = [UIColor lightGrayColor];
        noInfoLabel.text = text;
        noInfoLabel.backgroundColor = [UIColor clearColor];
        noInfoLabel.font = [UIFont systemFontOfSize:20];
        [noMessageView addSubview:noInfoLabel];
        [self addSubview:noMessageView];
        self.emptyView = noMessageView;
    }
    
}

@end
